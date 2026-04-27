class Bunpy < Formula
  desc "One binary for Python: runtime, packages, bundler, tests"
  homepage "https://github.com/tamnd/bunpy"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-arm64.tar.gz"
      sha256 "1f1a4edce251163646662bc07da166acd88ee3e7d6a5786e015db408b7a91c01"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-amd64.tar.gz"
      sha256 "069f4ea0e2780869466d94bb93845315cc77c5519a4f2676051d438bb02858dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-arm64.tar.gz"
      sha256 "f97c31c4caeccfe89ff8b61721528dce20c69465bd66ee0d40c968a64eeced0c"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-amd64.tar.gz"
      sha256 "13d58d7355283529517fa2c261dbc73ca0ce1ce6f6988777234a933cf3ba9da0"
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
