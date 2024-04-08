Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1338A957903
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHp4c9hz3fpY
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AI6P3wXR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCtsq2rVvz3dSJ
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 01:53:18 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-516ab4b3251so5050452e87.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Apr 2024 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712591589; x=1713196389; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xVLdz4RCZPpmOoRrLeAZgIbqKfFqmRWvMYiTDdq2jAw=;
        b=AI6P3wXRgb0/SAEA6nKTj/Zh06C3cPKwr5wfjFjwbiRK3PaTygYXj+riqfe18brcuY
         HZK34cQaBzx8LHsUBhkIVND3Q64NVIdTZWmwn2/ZyKgebVUdoAE394d1p3dJQUcogR84
         NR6T6/qj39fh4m1zjpaDhn+cL4zlxauVUB/CcJw9hR9lS4RvLGo6+sd0Zt04lZYMrVp1
         23M5kS4i+2f7LF7iNp7pNB/pEAcEaKVXqCbZ16ou9qqoa3EkKSkwl1+XG36SMVunYli9
         wpv2syaLoIlJ59sEGBS/h/x6m9zNMai9snJ38mYJOfEbsdHaIrGfH84q2PfG3etCoI6v
         1k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591589; x=1713196389;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVLdz4RCZPpmOoRrLeAZgIbqKfFqmRWvMYiTDdq2jAw=;
        b=gUTajLwEpMdlY8HioxRH3KbQi/0OoDGaoQWkT94DonaQHL2bKv2uHj701v212dqFXP
         zCEBjkfMgptg4usYpLTol2awRuhk7fvpoto8xH4K+CmiES6YRMO+GqP+h9F+0uVhwGCe
         YFJKUPxF99q09WpcuUNGdO3JMFhcolRNGxh+pmfX2l7nV8bCkvUTUb9e+BWayJV/Svb+
         war6//FfEuYrF8W8yEDX2rS7ND1RIKRtjPJ8VAhgLGeQXv3EAbZicyhAvgEdtL7FtpDl
         dagDD8L7/NTM9VjpIgdJvAsjlv+VXyZ4vqLJgCOoSH/mbM5RwiKKOUn19VA90Q/MNCjZ
         GGwg==
X-Forwarded-Encrypted: i=1; AJvYcCXbIdg/fAIgBqCbjqysMTTT4OPCOWERZekl/g1JYadQA51iP92C5PY0oXtoIDbqMuVzHUg1i53huaqitXVRBu+M/Adt9ooFwq2e/bwMvg==
X-Gm-Message-State: AOJu0YzW1JiUzBMMUBB2mM1Q2wBFEdK6W76R7bXNi2D9dwqdyIDwrZ/u
	HlqrcXjCLexKV2h1kzkA1YelHnODp1QcSdsdIbtvedTu9oUX4xlB
X-Google-Smtp-Source: AGHT+IGzkzf5ZrBVW/uel17iRj5iBd72o+sCS+boDhbrVpfv/k6Y+8z0gJzljcMw4rpZZlrNTvlNDw==
X-Received: by 2002:a05:6512:48d3:b0:516:d4c2:5410 with SMTP id er19-20020a05651248d300b00516d4c25410mr6728199lfb.64.1712591589101;
        Mon, 08 Apr 2024 08:53:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:53:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/9] rtc: convert multiple bindings into dtschema
Date: Mon, 08 Apr 2024 17:53:00 +0200
Message-Id: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANwSFGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEwMz3aKS5PiUkuLkjNTcRF1jAyMLI5MUw9RkIwMloJaCotS0zAqwcdG
 xtbUADZmsIV4AAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2339;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=paSRMDlNckWuA66r0WKViWnghhZr2E5Sml0Yhn2MVmA=;
 b=GAJVhgkJAZP0MyB/TYi4TIjAYjqRazVZe7IXvjdW4YgRzeNyvEn4Ew/bDpudVVhHq2CSqzfUY
 +sNcF1axU/XCPPo3HkltSviKDTQIXOLzo27aEU2RSX7PEaEuMfS/VOD
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series converts the following bindings into dtschema, moving them
to trivial-rtc whenever possible:

- orion-rtc: trival-rtc, referenced in arm arch.
- google,goldfish-rtc: trivial-rtc, referenced in mips arch.
- lpc32xx-rtc: trival-rtc, referenced in arm arch.
- maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
- rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
- pxa-rtc: add missing properties and convert. Referenced in arm arch.
- st,spear600-rtc: trivial-rtc, referenced in arm arch.
- stmp3xxx-rtc: convert, referenced in arm arch.
- via,vt8500-rtc: trivial-rtc, referenced in arm arch.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (9):
      dt-bindings: rtc: orion-rtc: move to trivial-rtc
      dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
      dt-bindings: rtc: lpc32xx-rtc: move to trivial-rtc
      dt-bindings: rtc: maxim,ds1742: move to trivial-rtc
      dt-bindings: rtc: rtc-aspeed: move to trivial-rtc
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: spear-rtc: move to trivial-rtc
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
      dt-bindings: rtc: via,vt8500-rtc: move to trivial-rtc

 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 45 ++++++++++++++++++++++
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 ------
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 ---------
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 -------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 -----------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 --------
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ----------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 18 +++++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 --------
 12 files changed, 103 insertions(+), 149 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240406-rtc_dtschema-302824d1ec20

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

