Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB8653A12
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Dec 2022 01:21:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcrZM3Jcrz2yjR
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Dec 2022 11:20:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IvK3f51M;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+icon.mricon.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IvK3f51M;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nck4n2Mpgz3bY5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Dec 2022 06:28:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0914EB81C11;
	Wed, 21 Dec 2022 19:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB682C433EF;
	Wed, 21 Dec 2022 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671650899;
	bh=SgIYscCI2WWmovIM5nFHjpdoI0vUI0Hpccma397neIs=;
	h=From:Date:Subject:To:List-Id:Cc:Reply-To:From;
	b=IvK3f51MNa5+k90PPwx2Ep68WpT11S5jtttMxjRvhH94C18jS67SUxsyopudOFsN+
	 Xs10S36LMTt4LCJIeSsyRwqeVNdA1DX3VguDrmjs1qV+2+0Ccl9bVswt9r7Nna4Y5I
	 6Z1r7tqmq1mH44hhLcQdNB3LiudqkC7oHJyApCBn9xKg/8FtGweOyogS5K8G6Q6Fg2
	 7aeXpYa3LUpJRJIJU7YIKWWkWGkm0Yk1O+tLYy4mydf6S0PaW+NefO3lhGLgsx1lLv
	 QOm9o4TM96bFrWVmfI/NzuUpTBjRe0rNLBSAzPRoBu88O2aWBTyzydPcH6NIBX1hMR
	 xTSYeXVz137VA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F51C4332F;
	Wed, 21 Dec 2022 19:28:19 +0000 (UTC)
From: Konstantin Ryabitsev via B4 Submission Endpoint
 <devnull+icon.mricon.com@kernel.org>
Date: Wed, 21 Dec 2022 14:27:59 -0500
Subject: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-lanyang-lable-fix-v1-1-eb6e11eb4a6c@mricon.com>
X-B4-Tracking: v=1; b=H4sIAD9eo2MC/x1NWwrCQAy8Ssm3ge7iA7yK+JHtTm2grpKIKKV3N
 xUGhnkxCzlM4XTuFjK81fXRQqRdR8Mk7QbWGppyn3MK8CztG35wmcGjfvjYH1DHtK/5BIpdEQcX
 kzZM2/Iu/oJtwdMQ/f/Z5bquP95wODB8AAAA
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671650898; l=1212;
 i=icon@mricon.com; s=20221221; h=from:subject:message-id;
 bh=2IbMt37be02samN0SyLfQQMRKqpQAoGkiG6WjPTqeHE=; =?utf-8?q?b=3Dvky9FSwxUi52?=
 =?utf-8?q?4bgC0XAV2tIoUj+s5J6LHm9YNa6hbEgx1ns8LctbBs+ql6Q21U0spd5JmTc6j9Bm?=
 NcUS5faPCAN15saXFVSPQNRNPm0aTh0AM3NW6ctQGnj29YEq3LJQ
X-Developer-Key: i=icon@mricon.com; a=ed25519;
 pk=24L8+ejW6PwbTbrJ/uT8HmSM8XkvGGtjTZ6NftSSI6I=
X-Endpoint-Received:  by B4 Submission Endpoint for icon@mricon.com/20221221 with auth_id=16
X-Original-From: Konstantin Ryabitsev <icon@mricon.com>
X-Mailman-Approved-At: Thu, 22 Dec 2022 11:17:03 +1100
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
Reply-To: icon@mricon.com
Cc: linux-aspeed@lists.ozlabs.org, Jens Schleusener <Jens.Schleusener@fossies.org>, devicetree@kernel.org, Konstantin Ryabitsev <icon@mricon.com>, Konstantin Ryabitsev <mricon@kernel.org>, linux-kernel@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Konstantin Ryabitsev <icon@mricon.com>

Fix an obvious spelling error in the dts file for Lanyang BMC.
This was reported via bugzilla a few years ago but never fixed.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205891
Signed-off-by: Konstantin Ryabitsev <icon@mricon.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
index c0847636f20b..e72e8ef5bff2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,12 @@ hdd_fault {
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
 		};
 		bmc_err {
-			lable = "BMC_fault";
+			label = "BMC_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 		};
 
 		sys_err {
-			lable = "Sys_fault";
+			label = "Sys_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20221221-lanyang-lable-fix-605edf14d27e

Best regards,
-- 
Konstantin Ryabitsev <icon@mricon.com>
