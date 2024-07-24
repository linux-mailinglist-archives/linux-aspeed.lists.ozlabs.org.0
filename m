Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B9D93AD50
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 09:44:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aiMyUzfU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTQy86y1Jz3d28
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 17:44:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aiMyUzfU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTQy41vXPz3cRr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 17:44:11 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7a2123e9ad5so426360a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721807048; x=1722411848; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4F00nC0aEQgAU2JQcnZhvx+pNtSLi0UD2dyzclH44fc=;
        b=aiMyUzfUW4EP1EeC3zDqajnuLjVZP9lT2BZhRsFpozRW5YJxYL5C5nEgIncvyEF/tx
         QkJjzytJX3bj+YYW1Weh+oEKPH2uflNkdtahnPwqqwO1MMPJluhr0pKOeZhog0LjlwQQ
         LQjS/K35jq6bONnmP4zOW8n+fka1FmPHX+HmmzoXZJJCS7d5Jv5xn3T3CwxW5PCGBMOh
         VCJVuF+jNDsy0oP+07qLd+678uy36rFbFM8mJxP+XrH7T6+6L/Z1cuo2eRPXLvLX7igC
         EUn+1SLUfIkaTONeudV+5eSVlyH+1A6bwf1X8hAb+9+DB8Y0u+2cVe4T19V8+woQ3/Wl
         NzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721807048; x=1722411848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4F00nC0aEQgAU2JQcnZhvx+pNtSLi0UD2dyzclH44fc=;
        b=cD4T2PNqCAskNSu2FdE5YEBvxs2Y0UdIrTiRCYsbePoxQalwN9YV+hVq8pZ5aJSeZ3
         IE6vFiPgoKIGcCvY+3n1rMnIHahfYw2dH/gjniJIAl7M3EvNskyDSiSnH281hUqsKx2g
         9FBmjtqJy85pcIgyCjEfkgJnKc0eVS+B5VM3tMpEEhlLtzwp2i8baf8Y1T5n+zxUzBm0
         8MTuA9OsPRW1twp6WRM/jPmbgL8sLHwH99NeChccCkItQWPMgUnp1jD3m4iIea14UVfY
         dXGOjVUugC6mEX87R/6pdnM3/K3tmZdBEiEmbVD3cBsLfQtg9VzB4BWlMGJZTJ7HISaf
         hXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+RBCakjj2x1GCwxKp9WbdMda4xNF8rNCo5PYv8P7mG6FtkhptyZs75nlO3hhOTigg6lk51SBYUnNIpltdGbZs0OLwVRbQLqV9PGHEeQ==
X-Gm-Message-State: AOJu0Ywqr9d9pH1+MlitDnyq9jXvitD0c/nmT0xHU+4UnpFehJnkAlvo
	SK0FUD8vLy23lpard76Ss8fUfcjW2U81NWb627ItykxStwQgV1ox
X-Google-Smtp-Source: AGHT+IH+AwD1aouWTaRvdXM6MuGKk9ijP8X4cF9PTF6xlLLizdRT0IHEkSF5UkMMP5UhMDiEV+RPRQ==
X-Received: by 2002:a17:90a:3983:b0:2c9:6abd:ca64 with SMTP id 98e67ed59e1d1-2cdb93bcbf5mr1736629a91.9.1721807048050;
        Wed, 24 Jul 2024 00:44:08 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74b9ed5sm901067a91.49.2024.07.24.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 00:44:07 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Wed, 24 Jul 2024 15:41:44 +0800
Message-Id: <20240724-potin-catalina-dts-v2-0-ba8d475c4073@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiwoGYC/x3MMQqAMAxA0atIZgM1CkWvIg7RRg1IlbaIULy7x
 fEN/2eIElQiDFWGILdGPX0B1RUsO/tNUF0xkKHOWOrwOpN6XDjxoZ7RpYir40a4pd7ODZTwCrL
 q80/H6X0/mljLcWQAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721807045; l=899;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=YuV6ArA1Xeknabf2oY+P/DgfOtGp1wRcYZboNfCQoH0=;
 b=zzLqfesCJ2y9JPuSPO3YM8JcLVFon8Vg59eJr7NsHxEV8Use4SeRuMO+trlUElrlC1steRYBs
 ObNcWYcZ2Q6B/SbfKI7vrtBnOcmzFl/wqzPv106AbHak9owKyYAwKFm
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Linux device tree entry related to Meta(Facebook) Catalina specific
devices connected to BMC(AST2600) SoC.

changes v1 --> v2:
- drop commented code in dts
- rename i2c-mux channel nodes as i2c1muxXchY
- rename gpio expander as io_expanderX
- use "stdout-path" instead of "bootargs"

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta Catalina board
      ARM: dts: aspeed: catalina: add Meta Catalina BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1020 ++++++++++++++++++++
 3 files changed, 1022 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240724-potin-catalina-dts-fda1ea3297b1

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

