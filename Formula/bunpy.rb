class Bunpy < Formula
  desc "One binary for Python: runtime, packages, bundler, tests"
  homepage "https://github.com/tamnd/bunpy"
  version "0.11.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-arm64.tar.gz"
      sha256 "ee98eeef0b72b804a8934543d7c53673339d4be467fdeb7c43ebdcdca44b9575"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-amd64.tar.gz"
      sha256 "ebf17336a96f6d6d129744e6c9115cc1e9ec176202f9422c5d4d37e069c63e0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-arm64.tar.gz"
      sha256 "f6dc818469f6a299aaea08d099c0385b0d9d21a305b5fc37f71bffd2087fc80e"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-amd64.tar.gz"
      sha256 "74062c0a9d9b5726d32dd73d23e3ea36fce1424241f55f6b360818406971fcac"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    stage = "bunpy-v#{version}-#{os}-#{arch}"
    bin.install "#{stage}/bunpy"
    if Dir.exist?("#{stage}/share/man/man1")
      man1.install Dir["#{stage}/share/man/man1/*.1"]
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bunpy version --short").strip
  end
end
