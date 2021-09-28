Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422742345B
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Oct 2021 01:13:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPD0W00Pwz2yPT
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Oct 2021 10:13:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=tommy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJPMk6fdHz2xYV
 for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Sep 2021 12:58:06 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18S2aVAJ072697;
 Tue, 28 Sep 2021 10:36:31 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 10:57:11 +0800
From: tommy-huang <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] dt-bindings: gpu: Add ASPEED GFX bindings document
Date: Tue, 28 Sep 2021 10:57:03 +0800
Message-ID: <20210928025703.10909-7-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928025703.10909-1-tommy_huang@aspeedtech.com>
References: <20210928025703.10909-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18S2aVAJ072697
X-Mailman-Approved-At: Wed, 06 Oct 2021 10:12:27 +1100
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add ast2600-gfx description for gfx driver.

Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
---
 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt b/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
index 958bdf962339..29ecf119cef2 100644
--- a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
+++ b/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
@@ -3,6 +3,7 @@ Device tree configuration for the GFX display device on the ASPEED SoCs
 Required properties:
   - compatible
     * Must be one of the following:
+      + aspeed,ast2600-gfx
       + aspeed,ast2500-gfx
       + aspeed,ast2400-gfx
     * In addition, the ASPEED pinctrl bindings require the 'syscon' property to
-- 
2.17.1

