Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770E306327
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Jan 2021 19:24:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQsSP21DdzDr1f
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jan 2021 05:24:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TBvLEZd6; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQsS64tjCzDqnr
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Jan 2021 05:23:45 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id a12so4043917lfb.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Jan 2021 10:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7/VIyGCkm6WYqKuSW58avCCQFZDvTdRr+WLSSIBWpSM=;
 b=TBvLEZd6eR8Jg1s6FBNMAsAVrQzkqhI0GamcHJFR7LYDoC9+HWYDPnG4cBG/0AXMmd
 PTY5bwWHS5+6Ld56/bbGo6ZSKna9l/BctnyrZELbIt3ksQ/xQvEclVg7bwgi1nIkv7na
 vAvqqVwsh5/Xte+BQIc3jG+MlayezjwET+giP4pp77SBZ7ioZLLwNxiriXNllDHaDvyJ
 oUMfs7YegcAM4U4RkKOQhNvoGQ32Hzf29gFjCr8Svt+uWT8067EJibxtDGxs04Qxo36O
 3F+jWvWxsdmKYe5dSmf1+ZuOu2a9beGROlFbyuUm7U9i4hQKtPni4rL8jzCUNVaBThIz
 UQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7/VIyGCkm6WYqKuSW58avCCQFZDvTdRr+WLSSIBWpSM=;
 b=CJ2b+iJU30kQazrcStA1ijf4AlL4TKqr8Zmnsmw/wOotO0rOd/1qylboBvOftH7Hos
 ppfm3BHn8y6s6sLxjS85OH5hbTM8tSBVR67cV1W0N43OpbI3FJDrwpY9MWy7tjbRNlYS
 FI0qP7/MUbtm3RlzwFD+zebHrRsyjw1f0dB2SEfXKUO4vhAy3OxqQh5QP97ULpdW9QpA
 FZBTFJaVjgRQ2crsEcS0wliZ+Pw/4fuo7HhDFNec4AP2xIbA+2qw6bGg5U5GIOuIRfk2
 WLS4ZOWt2PPdUGJ1ldym8+xXEpTu26Ko6y+jrbfARyRUo0eZaFR4m5ieD1ZYQaiptgkk
 2SDQ==
X-Gm-Message-State: AOAM530BUy5J6Y60rhkTxDUC1qB6EdkyOvh80JqNdgdYsuUji1XS/sJA
 m3i/WUKZ5s8j3ikBWq47NIU=
X-Google-Smtp-Source: ABdhPJxuj9qRi3BNtT+pBYV+AmDZUin5XCQxcaFgTFWsE+uJi/i7tX09ihVfB5PlDCiOkSD+r8CdDg==
X-Received: by 2002:a19:838c:: with SMTP id f134mr5518819lfd.424.1611771811861; 
 Wed, 27 Jan 2021 10:23:31 -0800 (PST)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-11-119.ip.moscow.rt.ru. [46.242.11.119])
 by smtp.gmail.com with ESMTPSA id q26sm667065lfd.17.2021.01.27.10.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 10:23:31 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH] ARM: dts: aspeed: amd-ethanolx: Enable secondary LPC snooping
 address
Date: Wed, 27 Jan 2021 21:23:26 +0300
Message-Id: <20210127182326.424-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 aladyshev22@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, supreeth.venkatesh@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

AMD EthanolX CRB uses 2-byte POST codes which are sent to ports 0x80/0x81.
Currently ASPEED controller snoops only 0x80 port and therefore captures
only the lower byte of each POST code.
Enable secondary LPC snooping address to capture the higher byte of POST
codes.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 96ff0aea64e5..ac2d04cfaf2f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -218,7 +218,7 @@
 
 &lpc_snoop {
 	status = "okay";
-	snoop-ports = <0x80>;
+	snoop-ports = <0x80>, <0x81>;
 };
 
 &lpc_ctrl {
-- 
2.17.1

