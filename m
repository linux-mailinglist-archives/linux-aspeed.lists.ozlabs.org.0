Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C8957914
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHt6Nm8z2yyx
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KeBvZ+Zh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4cV6ksJz3vhj
	for <linux-aspeed@lists.ozlabs.org>; Sun, 14 Apr 2024 06:22:49 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso2296454a12.2
        for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Apr 2024 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713039765; x=1713644565; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMG7QinvL5fvXvhlkGS6yquNkWTfPbeKbJj9JJN47FA=;
        b=KeBvZ+Zh/HH4qakz7ttxBHESDk/xIW1cT5o76klRLXH+BftvzMNH7h7YOFlCKjIfZI
         rMcScIyThMXhBszEUN1SOY67t3x9PLWEbb6v0YoYCOGBFXH5nhhFVxjiJGTDSzUdWltM
         680iZvwFDU3p/yBAKOmNwRnOj04MvfLWg3Y+H++TRccgxHDFdBDb56uBwPJMwobO/Tq+
         /ZT9S6bgt6a22FPjUse0otbIXbswnZ5EeMC3NCN4E9/gqLxiXuvzj6CZeq3skNDrzON1
         X0AZ1b0QD2cAgr5cBKryvFkCXcFFNKATApCfKvzg7EEi63QVRplEPDE74zoMgzzJ6NG4
         NPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713039765; x=1713644565;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMG7QinvL5fvXvhlkGS6yquNkWTfPbeKbJj9JJN47FA=;
        b=aQ/nwFvNHGncs2/EDHm284ceidBFMMuF6cTwn2U6rVXoG0dRr9LPlJU5LwgxRD9fVl
         nHvYv76JphEHglqIfgKkLncDxZoOnfUhP2e0bXQQWLt6lrLqHoL5fNTmJHUbkuiKGwWj
         wuVe25JtYaibuj4gCHVqBNV1jjr8FG5dCO07Gjk/pmTFJM6YGlsqu1nNbIvb8i46GyNR
         sdCI8Wj//F3ShwrjJuXEhqlHuUWEVPWm7HRpKvVu5sF5U3Z3povGuC2cYEGPDyX2L4JS
         4N7JNJe9vnHWsSiaxpO1jEs1qS5XZUT3wb7Y4IXfe39uaOq22bqbHlt1dYsqZHtMQmWX
         pLEg==
X-Forwarded-Encrypted: i=1; AJvYcCUklJWs/Db3QZCrI7DDgjrlzliIm3L7jCbe0R7d6Ftm5uyGPYcrW2IPCnezqHrWgRk0BhWIaN/uQCdN5tJ30k0OtxK+d3spG3wTg//kTg==
X-Gm-Message-State: AOJu0Yw1ZWYUjbb2Si1h/C2HmAzoXWqaV68POad6i2eHdZx30+flSeqE
	3grtyPaS7uWZuUuwOP53P1E7SaYGaA0oDwvsvnNlyR1uKCqyfk+U
X-Google-Smtp-Source: AGHT+IEsB+cHdlx9K9FNSEQ8EBqYbBYDYSfIouBtzUo5TVCXTptsRk0ac0wtO3XnSf5mJphM+OEMbw==
X-Received: by 2002:a50:9b55:0:b0:570:1dd9:f16b with SMTP id a21-20020a509b55000000b005701dd9f16bmr392424edj.26.1713039764648;
        Sat, 13 Apr 2024 13:22:44 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 13:22:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v3 0/4] rtc: convert multiple bindings into dtschema
Date: Sat, 13 Apr 2024 22:22:15 +0200
Message-Id: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHfpGmYC/13MywrCMBCF4VcpszYymaQXXPkeIhKTtA3YRpISl
 NJ3Ny0I1eU58H8zRBucjXAqZgg2uej8mIc4FKB7NXaWOZM3EJJEiRULk76ZKereDooJpIak4VY
 TQk6ewbbutXGXa969i5MP701PfH2/UPMLJc6QaSnrUlKrRUXnblDucdR+gBVKtIs5/sWUYyNIc
 a7uWMtyHy/L8gFDfrtN5QAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=3124;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=bnx5sa8KDICe1vW2NAmHoFaeywkUORylyqHPjnVp/BA=;
 b=PyA3c914YDhLOl3SoDtKOi+FMBNuMKW9+wWIfwifi+Tny4hwNMF+Ektaon7HNNZUuJbyZ5uuY
 3mlk07mgOcwCCpGxdG2f9xUrbgHTycqC6/02u1izGaMmelxyjfwrYbg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series converts the following bindings into dtschema, moving them
to trivial-rtc whenever possible:

- google,goldfish-rtc: trivial-rtc, referenced in mips arch.
- lpc32xx-rtc: trivial-rtc, referenced in arm arch.
- maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
- orion-rtc: trival-rtc, referenced in arm arch.
- pxa-rtc: add missing properties and convert. Referenced in arm arch.
- rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
- st,spear600-rtc: trivial-rtc, referenced in arm arch.
- stmp3xxx-rtc: add compatibles and convert, referenced in arm arch.
- via,vt8500-rtc: trivial-rtc, referenced in arm arch.

The only reference to the lpc32xx RTC makes use of a 'clocks' property
that does not describe a controllable signal (it is in fact a fixed
32768 Hz crystal, the input clock of the SoC). Remove this property to
better describe the device and avoid errors when checking the dts
against the RTC binding.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v3:
- Fix typo in commit description (rtc-aspeed).
- Move lpc32xx-rtc to trivial-rtc again.
- Remove 'clocks' property from the rtc node in lpc32xx.dtsi.
- Link to v2: https://lore.kernel.org/r/20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com

Changes in v2:
- General: squash all moves to trivial-rtc into a single patch.
- MAINTAINERS: remove reference to google,goldfish-rtc.txt
- lpc32xx-rtc: create own binding to add the undocumented 'clocks'
  property.
- fsl,stmp3xxx-rtc.yaml: document missing compatibles.
- Link to v1: https://lore.kernel.org/r/20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com

---
Javier Carrasco (4):
      arm: dts: nxp: lpc: lpc32xx: drop 'clocks' form rtc
      dt-bindings: rtc: convert trivial devices into dtschema
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema

 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 51 ++++++++++++++++++++++
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 -------
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 -----
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 --------
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 ------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 -------
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ---------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 ++++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 -------
 MAINTAINERS                                        |  1 -
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |  1 -
 14 files changed, 109 insertions(+), 151 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240406-rtc_dtschema-302824d1ec20

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

