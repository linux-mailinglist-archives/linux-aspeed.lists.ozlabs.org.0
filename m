Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A80672062
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 16:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxpq56ZDBz3fBp
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Jan 2023 02:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lvY1l95m;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aaelhaj.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3lwniywckdo4qqubxqzweewbu.secbydkn-qifuutbyiji.epbqri.ehw@flex--aaelhaj.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lvY1l95m;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxpq032LTz3bTk
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 02:00:42 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p204-20020a2574d5000000b007f1def880b0so4945723ybc.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LyLfN4Mi1/PXpiir6MvuChlkwaHrtK328hAazNCRUWM=;
        b=lvY1l95mtOX1zPjOduSsS1/6e+L7oILtmQromeN396Bzr2XI2LSAjV9ANA0g1/grex
         SrOMRCWIPq64bbTQccHWbXTipNbs/LX5cYWqUM22+qU8+xDhg3UPXQ6e66s7ogYSkfKa
         VeTPY7D0/evXvT6OfsfhCLDNWlqRuB7sjlZQF5/YaTlu6CN7YcMuEAmLPV4mk3uR2luY
         fw14CNFEwJTHbS6cT+6fHWVQDqSHunzp0VUxenUYy9quYkuJ7ngyMhfpxh6u/TSs/LTb
         HjBuf3aRQwZx1NgFbuhBDWi+Gl2INpRekpLRDOGJi6aP8pgOoxuTHSrmh0CUrMTFHlRj
         Fohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyLfN4Mi1/PXpiir6MvuChlkwaHrtK328hAazNCRUWM=;
        b=Se4+7Wi9YkXw66t9U41XRHC/rDA8QXXx7W2pmfooofG0ZpAHKllLOJYCTTpcegNpFk
         t4LAl3nkoqQTpup0if53HxZWgNlUY/Plf89hKtZg9X+07Otz8cbSjTqdMI8ha+YK7CUI
         2jQSaqnAD+yxbP3T7fE9ar5GjIKxgNf2lsE8dqSK0sFz2+MNUgZIf3jOjsRFay3e981a
         cn2CX4TyWs4j+e+ayxQ853/owFGivbMAqhE1bAh4E1AUjoIDpdy0g1hOFkmbEhjq5Aqy
         ZN8XbxrazAL56+JR+srZpjYbddhK3EORUPbZOWNmHyJ4vYW+AgmopzslH564w5vRiBQ6
         dHog==
X-Gm-Message-State: AFqh2krN71q/OpL2tbcDaCZvk32LZmis6zyPUmVakjLfVA97n1LitDZ/
	OE/DIT+Dc8doDjmTbqtvy1M1c1XbPfZs
X-Google-Smtp-Source: AMrXdXsHf3zFoA2FXf6XVZ/0Vm8PsQPJzCSEQ911YS5cm4bZMzNTvAEM4Katw8ZuMuJZd9JeS7fNPQRTW5uO
X-Received: from aaelhaj2.cam.corp.google.com ([2620:15c:93:a:627e:ad17:ff9a:fd16])
 (user=aaelhaj job=sendgmr) by 2002:a81:cc2:0:b0:4db:3866:6fa6 with SMTP id
 185-20020a810cc2000000b004db38666fa6mr855980ywm.44.1674054039221; Wed, 18 Jan
 2023 07:00:39 -0800 (PST)
Date: Wed, 18 Jan 2023 10:00:30 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230118150030.2079226-1-aaelhaj@google.com>
Subject: [PATCH] arm: dts: aspeed: tyan s8036: enable kcs interrupts.
From: Ali El-Haj-Mahmoud <aaelhaj@google.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: aaelhaj@google.com, osk@google.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

When the BIOS is built with kcs interrupts enabled, not enabling
interrupts on the BMC results in very poor IPMI performance.
The other way around (BIOS with interrupts disabled, BMC with
interrupts enabled) doesn't suffer degraded IPMI performance.
Enabling interrupts on the BMC covers both scenarios, and should
be the default.

TESTED: manually verified IPMI performance when BIOS is built with and
without KCS interrupts.

Signed-off-by: Ali El-Haj-Mahmoud <aaelhaj@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
index 708ee78e4b83..f6c4549c0ac4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
@@ -364,6 +364,7 @@ &kcs1 {
 &kcs3 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
 };
 
 /* Enable BMC VGA output to show an early (pre-BIOS) boot screen */
-- 
2.39.0.314.g84b9a713c41-goog

