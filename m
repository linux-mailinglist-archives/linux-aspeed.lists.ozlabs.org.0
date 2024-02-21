Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A5685D3E0
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:41:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZSfSDuUy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrrl1L4Jz3cS3
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:41:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZSfSDuUy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfrrZ5DS6z2xwD
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:34 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bbb4806f67so4370869b6e.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508491; x=1709113291; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWiN52HZtOJyunoIk+D9B+tPXzXySquVGdLsSRQKF0g=;
        b=ZSfSDuUyV6hrJgVBtUldLGQjFWhqkbWyS8VK+fFZygF/nB0EPP/afQgXYhRU6v0ItO
         WGnjQrmliBtxDjalHwtTCecSdc8qL3e1U1WcNFeTiRV0sXvAH5mU7B9C+1lQDmlSB9Rb
         wXPIi7Z7uK4Nw1BrOfTKFHN96z59DvUr6yvhmGS+gJTIoUrkPtIiLU7vadzJBQ87Erpo
         De+XIYWHTn131/iKetpUP3PhE2k8wr7lowu5f+t5tyv2em9M5V6nilzLVYPcnRP1a9zy
         QNTE1RjmDDWSjSAtC4I3XVZOYbVDj+MY+O1x/PKpnX7JbFLhXjFAOVnlDisqzt3Pi2B5
         dI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508491; x=1709113291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWiN52HZtOJyunoIk+D9B+tPXzXySquVGdLsSRQKF0g=;
        b=Uy01e2IfYKO7e8jOZfWgPBmtuXsAg4/GR1So6xQUc+/Xi1PRS7B7dF3EcseMgBsNhm
         KeJyV69AJTlF8OOyBs9g2gIUZ1SNLc8cZImzTPu2mgfxILQiyQn2Ue97nx6vNvesjnVH
         ba5JvITRBvNk4FxY8poGwDZ5soVO93jql06f22dcBuK0kvt8LxcYdvjQyPAYhrPTMup+
         v6jHmq9adBj/dqvPVXResUS41h0PkV/9qOuFLB7HZwWFK9f0JE5R7ISQIIKjRaerwIlY
         KcpoXM5rWXreP6yYXgrltWqaRARUHPDfgd5bSuL4XfRIAblRZL+NlDfbbwiCzed1yFAU
         asgg==
X-Forwarded-Encrypted: i=1; AJvYcCW64fL2ZqXTRC7YFfzq9YmFqdNN0Iovge9xv3+/BiBtN1+UqrtZQHJJPPKkVvGzjRdjfnUGxLHWNldxVqbhJTXkmrstp7xs0JKnE3e/7w==
X-Gm-Message-State: AOJu0YyJWt+6OkHSJz0dNQaHRrJpMklc4cNdjBm5Oh537wuYoJkm2Xx1
	4M4ZBrnTunZWQY8BkLdBO6FILEw5Dh+R4HybHc9U+SeX1RIgfzvA
X-Google-Smtp-Source: AGHT+IEJ76fTRizHLqPSQ5rnEgwbGtWfwj6l3vs63i0y1QwzOgt9UIioZw4FdreC3cMjNfkMUQE/fg==
X-Received: by 2002:a05:6808:138f:b0:3c1:5515:2599 with SMTP id c15-20020a056808138f00b003c155152599mr11687245oiw.39.1708508490907;
        Wed, 21 Feb 2024 01:41:30 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:30 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] ARM: dts: aspeed: Harma: Revise SGPIO line name.
Date: Wed, 21 Feb 2024 17:39:16 +0800
Message-Id: <20240221093925.2393604-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The same name as reset-control-smb-e1s
change to reset-control-smb-e1s-0 and reset-control-smb-e1s-0.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP8Qbepm1AVjuCbaKw@mail.gmail.com/

Change log:

v2 -> v3
  - Patch 0007 - Revise max31790 address
  - Patch 0008 - Harma: Add NIC Fru device
  - Patch 0009 - Add ltc4286 device

v1 -> v2
  - Add infineon,slb9670 information for tpm.
  - Patch 0006 - Add PDB temperature.

v1
  - Patch 0001 - Revise SGPIO line name.
  - Patch 0002 - Mapping ttyS2 to UART4.
  - Patch 0003 - Remove Vuart.
  - Patch 0004 - Add cpu power good line name.
  - Patch 0005 - Add spi-gpio.
---

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7db3f9eb0016..8a173863ef24 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -505,9 +505,9 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"","reset-control-smb-e1s",
+	"","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
-	"","reset-control-smb-e1s",
+	"","reset-control-smb-e1s-1",
 	"host-ready-n","reset-control-srst",
 	"presence-e1s-0","reset-control-usb-hub",
 	"","reset-control",
-- 
2.25.1

