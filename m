Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B795790E
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHs0qLQz3bWp
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mnBc+D+5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6qr1G7Qz3cN6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 01:55:50 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so1139126466b.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Apr 2024 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712764545; x=1713369345; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jsjr/EUpS7jHu9EoCoBO4JHqmCRBqh6/KIR1YSfDMJk=;
        b=mnBc+D+5+YGtxh7w6uhLqbjHVMFJ5FxP3u0KVDc9T7cxgbJpMqzWWJEtigWHrvjMCf
         j/4U2CPSB/rpnTfIXkfuS14Nocy56PFACi4c5/bvDv05Kt21MN9ACRzEgjlQcMWNiOiC
         8Sgf86neTPiD/2V7oWbfcCNtMRwhc29RpGsUGpsnd5xT4fWz05XfrttNZTGTogt8P+rL
         wa7QpJXz+27wfYrTwamEYnq/1pRRlnyMhO6z+llGTSRByLLGn5Fg3JUTfvpRALjG5qqC
         hYVoQeIsrUfqK5xgrZjEpulTbr5OloWFLtQ1N20ar40m5/jGcSBK5Rgnq5YXVDNo5TP9
         FbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764545; x=1713369345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jsjr/EUpS7jHu9EoCoBO4JHqmCRBqh6/KIR1YSfDMJk=;
        b=f/wizde4sBegP+7rP0MmNF8i3DYobJK5nby9uBZZW6PdodZMZCD7vNtGcLmiD8cZPC
         lziEQkRIZaeCdkYvi52QrhxatHiAHWJUvkcWHIaFEcR7qkEpoSkSW8mi9RApwvdqsxDv
         MnVoppM6x9gQ2ARRshA/DOlNdlA0WnoBd/OD0fUnxsh2mFtnw641aygWNnGdEc5cxjYx
         gF9gkxJMACl+aFew5V6LfFzudV06hkaaVbMFXCMe2DszVgnt+ipCSSWxfxKVJGd/haIL
         ybUy9tR0rYPel+rK6UvLtFGJey1xxfubtRSJNyHdcmTx/Mskz1h0fQM4ozmkbI8VyXR9
         9a6g==
X-Forwarded-Encrypted: i=1; AJvYcCV8bySngpFr+U7nHUcJ/GSCU1RvzgcMmO4SFh337M8mfP5u93K+tnHfYsX5RqretS7ts5zJZRO7UKzwfTAiTx62G+Ot+svMi2zV6uVaEg==
X-Gm-Message-State: AOJu0Yy1Aeg2EvfUhhp76sVnXuAcrjiydKo3GkLuL1chVT7Du2bWi4UH
	kzy5UIEFNdqGRnxQYeL2A81i76nk2YjCmvJ/ZVTL8duVv+/rGY/l
X-Google-Smtp-Source: AGHT+IF1ADAUkQmkGJcp6oXbVsO2NNUVSgumq2+R9/e1RDxEbeDdhWqKmtLj8qqMmKKxMxSasjIpVQ==
X-Received: by 2002:a17:906:46db:b0:a51:d056:d08b with SMTP id k27-20020a17090646db00b00a51d056d08bmr90851ejs.0.1712764545559;
        Wed, 10 Apr 2024 08:55:45 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:55:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/4] rtc: convert multiple bindings into dtschema
Date: Wed, 10 Apr 2024 17:55:32 +0200
Message-Id: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHS2FmYC/1XMQQrCMBCF4auUWRtJprEWV95DipTptB0wjSQlK
 CV3NxZcuPwfvG+DyEE4wqXaIHCSKH4pgYcKaO6XiZUMpQE1Wm11o8JK92GNNLPrVa2xRTsYJtR
 QLs/Ao7x27taVniWuPrx3PZnv+oPafygZpRVZez5ZHKlu8Dq5Xh5H8g66nPMHsJC+eqgAAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2589;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=aG6841BM+IzaM2wdf6XPCQIKX1BJoLnJgWWJZ09aXUc=;
 b=vE6WWKn/PfJQl6Z2mF/T4S+0ooamNPIyWAComjIMzpGZf3t4nblGf7WzRI3Gd5nnqgkkLJ54Z
 rg1MNNHQsJxBMn808RjLrAfEPSzorjoLsdzH843SWqOs2s8K41Q8LrA
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

- orion-rtc: trival-rtc, referenced in arm arch.
- google,goldfish-rtc: trivial-rtc, referenced in mips arch.
- lpc32xx-rtc: add missing property and convert, referenced in arm arch.
- maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
- rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
- pxa-rtc: add missing properties and convert. Referenced in arm arch.
- st,spear600-rtc: trivial-rtc, referenced in arm arch.
- stmp3xxx-rtc: add compatibles and convert, referenced in arm arch.
- via,vt8500-rtc: trivial-rtc, referenced in arm arch.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- General: squash all moves to trivial-rtc into a single patch.
- MAINTAINERS: remove reference to google,goldfish-rtc.txt
- lpc32xx-rtc: create own binding to add the undocumented 'clocks'
  property.
- fsl,stmp3xxx-rtc.yaml: document missing compatibles.
- Link to v1: https://lore.kernel.org/r/20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com

---
Javier Carrasco (4):
      dt-bindings: rtc: convert trivial devices into dtschema
      dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema

 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  | 51 ++++++++++++++++++++++
 .../bindings/rtc/google,goldfish-rtc.txt           | 17 --------
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 -------
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 +++++++++++++++++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       | 12 -----
 .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 +++++++++++++++++
 .../devicetree/bindings/rtc/orion-rtc.txt          | 18 --------
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 ------
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------
 .../devicetree/bindings/rtc/spear-rtc.txt          | 15 -------
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       | 21 ---------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       | 16 +++++++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     | 15 -------
 MAINTAINERS                                        |  1 -
 14 files changed, 148 insertions(+), 150 deletions(-)
---
base-commit: fec50db7033ea478773b159e0e2efb135270e3b7
change-id: 20240406-rtc_dtschema-302824d1ec20

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

