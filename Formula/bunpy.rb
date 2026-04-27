class Bunpy < Formula
  desc "One binary for Python: runtime, packages, bundler, tests"
  homepage "https://github.com/tamnd/bunpy"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-arm64.tar.gz"
      sha256 "b05012b9857d88e60596a341ae2bf3b05db8e0ae43dccd1ff25c4c2a6e70b902"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-amd64.tar.gz"
      sha256 "66326288b44e0da72b67eaaac7d803fbea94100920d23cc1264db6743bf41368"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-arm64.tar.gz"
      sha256 "4f37ed83c4ba43268a82035833ecb370ae5dc4e06869515d469ac88b6e2e3162"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-amd64.tar.gz"
      sha256 "dc7bb48152734148f14132c35b61209cc1cd559c2f2a9ddd4881bddb7b6c486c"
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
