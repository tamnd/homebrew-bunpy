class Bunpy < Formula
  desc "One binary for Python: runtime, packages, bundler, tests"
  homepage "https://github.com/tamnd/bunpy"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-arm64.tar.gz"
      sha256 "24823df943942883320c4ede39ae94da987eab0fc3c7e758b60335a3ceb443f6"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-amd64.tar.gz"
      sha256 "bdc918bb5e8ebdfbe1a593bd782cb85231fc59158764218996424b307e83a4fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-arm64.tar.gz"
      sha256 "0425bb6aafacf1ac36d8e6622330b94e4146de111a3f75334c0feec383ecab89"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-amd64.tar.gz"
      sha256 "4a9e3fc71c431ab83b771445ac3e3ec03288959ba9aac3dab094afb75868ffab"
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
