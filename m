Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E027F292
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Sep 2020 21:27:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1mVF2S6tzDqWZ
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 05:27:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bwtKAAd6; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1mTG2ts8zDqV4
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Oct 2020 05:26:20 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id u21so2594100ljl.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Sep 2020 12:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWnZ9mvRcdMIs29UYvJHlCQSo8qvfoIKTMHbPpvZZgw=;
 b=bwtKAAd6Vcoubp2BQnsTmvzI/vYv7+Av/F/JrmcJs/PsR/eedl2ijMkIYf8utm4hvP
 0W/YJEb9S75WkQt3w1zke4KD5oytMyzt2ZAbbP47JVpTR2BDLO7hq8c0PnqQcHe4s/ZX
 QRyFyonWxPzFxXoZwVqxvGN1vCHk+OBK6Osj7k9MIJzJ+YB1Qiam+ldvRplSkD8m6eMK
 i4ncAPbo8AzO9UyMBWxuPQtYaUwrtmmDtAWgqt6W7B0R/8K4ic6VFBoZX9LiBRc06COS
 GYblUGAn8Z7PM81t4vHX8E2AKM7grU8/y058G716rn7XwvTZA5z7jLNETWn76LytRVvM
 67rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWnZ9mvRcdMIs29UYvJHlCQSo8qvfoIKTMHbPpvZZgw=;
 b=sdpAq9O9ms+6RtXnta3aEWkJ9YhtBDtlQd2mauJKCU+dLwplSj1vwbKKnjtVkgTDPK
 6AeR7sH0211HXzgjb6ztdhYD6MwX27PZijuZDzZIOue5ZAmDtHKDsKnwDu0Xs6YNDrG/
 7eUpaxC0BD4BUQtfa1RJ1epxPc4Ny3rXCeQa29hWIoZJRE3c28c1P2kOzDWLn/woQ0Zf
 syxkjexjD0ce5+tfsl3Epc+xyR98IP7+3qIlRJBKT8TTXtPH4R4gDD1oyDugkDf9mGXI
 YawjflsUnw8qIZIcKk+bRlB2HaDKa4UmMF10Gu6lhD6iUSUVVxzMYq0H3zSQAVNvLynQ
 7SMA==
X-Gm-Message-State: AOAM531K35HSUWyAP3taJG3VOkKWHofFRmH55bDbPWRGowXxmM7SsVYa
 ncY4AT7TfY0Fb7JsMJyJrR+EaZrL7h8=
X-Google-Smtp-Source: ABdhPJyyQebr6XX8eQ7cJK/5tttCpKN3MNA8TECnHfh8+dxLrkifeeUO3SBZu3RzmccOQiAcj6eu+Q==
X-Received: by 2002:a2e:3008:: with SMTP id w8mr1448482ljw.63.1601493975761;
 Wed, 30 Sep 2020 12:26:15 -0700 (PDT)
Received: from localhost ([2001:470:1f15:397:584b:5712:cb7c:21bf])
 by smtp.gmail.com with ESMTPSA id b11sm291476lfo.66.2020.09.30.12.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 12:26:15 -0700 (PDT)
From: Paul Fertser <fercerpav@gmail.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] arm: dts: aspeed-bmc-tiogapass: enable second MAC
Date: Wed, 30 Sep 2020 22:25:07 +0300
Message-Id: <20200930192507.27847-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Paul Fertser <fercerpav@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Tioga Pass reference design includes Intel I210 Ethernet controller
connected to the BMC with NC/SI.

MAC readout is not supported.

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 2d44d9ad4e40..b2ba798bf3c4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -196,6 +196,14 @@
 	use-ncsi;
 };
 
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii2_default>;
+	use-ncsi;
+};
+
 &adc {
 	status = "okay";
 };
-- 
2.17.1

