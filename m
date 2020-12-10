Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B442D579F
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Dec 2020 10:56:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs8TH0X2dzDqLT
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Dec 2020 20:56:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ktJdc72n; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs7vc3jD1zDqkd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 20:31:08 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id t7so3489676pfh.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 01:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9lTbkG6qYnle+XI3+FSoMjubtfTJEmSz5CKlrBtvf6E=;
 b=ktJdc72nQon+D8o3CN6amrYc+2R2Xe9NgVdEQLiUb+N9xnep1qCYhVISyvZMOpLcTd
 gVKcOMINlUiv1HeoB7QpbtjW465deQhf0MyfTUbovVHcmnDKAeimXhqiOo+VjifX2GaQ
 c7WyVGNhVp7mp8HHDLe1GzyXIfQeTOTul9CloydL2z1umdM+lCj6VJAx7YNamnea1t1K
 sE3EaHIZzeEDYLy7zUPftlI9SbcNrB6bg40LBRK/muMZmDxlc27+ma7bPNXvK4fjQB1N
 nYYHCSM+14iyW6EGFu/lhjpW7XD+wLBvgUuF0dAvELw9jqbp4ZauOGNHytfUb0wvpHFc
 0ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9lTbkG6qYnle+XI3+FSoMjubtfTJEmSz5CKlrBtvf6E=;
 b=lsVghsjnGPLJNSRUaltyNcTSiMe9JPagvQS8aDhcfBu/EOR0c2MvWNMppgLlmIb/en
 t2Whc/gNTGhq7e4GDwuvF0uO8551YnzEMF4YwrKW6DYI0pyFiaKMjltrrBm/7daHl93N
 9f/qSohzOcs48g2iZtRWOsE+3RmQCV0RlbT8uTn3V/Dshtv9ClBzs2LDEPdCSq1B8RqS
 kTqQA3CCaNcwi+m1kxvRAGBCz465Lz58JPKjRZWWqTqBnvSEJblBJfa+agxA3sA0Gv99
 7szJdQ1FNEjedabIEn5vgNOdVt6bKhgjUCWs4b+ZXCYLOIDy1kuPZPK4KWplnr2Fam09
 M0DA==
X-Gm-Message-State: AOAM532vPtU8SbZR40UKhKqFivH4gUHqcRpTX2NAYAUEHjktqymVGH/p
 +lp8E5KoZSXLE+KDOlCMkOJaxA==
X-Google-Smtp-Source: ABdhPJxvSV2G/C+0G+bkx6xFvzSF4bUj0cMreoupZzb+ckqOtPlyhaJ3KcVb6ZDrOtuDHEhxT/vL3Q==
X-Received: by 2002:aa7:8ac1:0:b029:19d:beff:4e0f with SMTP id
 b1-20020aa78ac10000b029019dbeff4e0fmr5893394pfd.0.1607592664959; 
 Thu, 10 Dec 2020 01:31:04 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id l1sm5043385pju.48.2020.12.10.01.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 01:31:04 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org, xuxiaohan@bytedance.com, yulei.sh@bytedance.com
Subject: [PATCH 3/3] ARM: dts: aspeed: Enable g220a uart route
Date: Thu, 10 Dec 2020 17:31:01 +0800
Message-Id: <20201210093101.413-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 89916a2eec18..e3a82679ed9c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -929,3 +929,7 @@ &video {
 &vhub {
 	status = "okay";
 };
+
+&uart_routing {
+	status = "okay";
+};
-- 
2.25.1

