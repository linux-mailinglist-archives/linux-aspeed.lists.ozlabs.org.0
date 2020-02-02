Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106F14FE56
	for <lists+linux-aspeed@lfdr.de>; Sun,  2 Feb 2020 17:40:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489cBQ2GTvzDqTb
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Feb 2020 03:39:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u340iptu; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489cBH39xwzDqD3
 for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Feb 2020 03:39:46 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id n96so5195892pjc.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 02 Feb 2020 08:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Gk+4kc7bcxmwm9qBtI8zt+2lMveHew9wDQSMTXKODNs=;
 b=u340iptusySS+Qerd7xdlTZcG85z+DOqIyNwWblPk+wKd/mjQdeyRPNZ7tBZILZJIU
 nLV87YzIrIaRUKOelw3zWhxGoxtSvfreF1prYR5Pq62u0z8YNovPC9zt6nh2cwbjH/xU
 CghTk52t3ZfZA8TdMu+FpUYi0PWJGQ4TMEGJ7kX3M0Daqaj/hkxY+FE65VS8OoZyUCut
 j1ag2/RLZSbf270ZAbGE1fAavbl4+qN/li3DtKCKBYrz47bzgIM1fQN9UTVdjA/2sG6K
 wExtbreSjQ/f6DMKTK6vwlgBuwBWv2F+yMOdtPnvi/bNPyBoJmFKblFcDAxiEpA3ndUt
 sAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Gk+4kc7bcxmwm9qBtI8zt+2lMveHew9wDQSMTXKODNs=;
 b=IQtgfL7fXkdmOvVd5/pQJcyZ6EdVTO03z2AompKZQFga7ur7083c8CT7t7dvMupDvt
 4CroWuai804BxcxoMvLy5jTQpm0BCnjLWRRIhx6ZRdQoDNGo5WRMiy8gz6OdGD8t05+o
 5h6HbLDMooW9f9zEDiFUNeK335M0y7K8TDnK2N/wnhB/gFP1glZ3t42ufIN9f1QBrlDk
 OUAIchVQL/GmE67LRm92+AVpDb4TNqQZuJSPG5XvTFAYXcjIxxgIR3TcZOz/ESEZQoA5
 c+hU+PIJfjP+rYBt5tY7SNe74RdMCZ6uAFkBQgxU5bEqKtqacHST30sZVTjbYPGzxMGC
 R60w==
X-Gm-Message-State: APjAAAXdFuTmK+9VfYEnA8VoSeOs69Z2IzcIw4pNw6wNZLJtmUptAQkr
 9lBNEROaCnVOFEK6FlA8a+A=
X-Google-Smtp-Source: APXvYqwHyC+cFz9eR+nX72AmYJ9CsrQ2dTwB0OTb/PsM1rItR9jKyRyX+djyVfGzuApXhbffE2IlLA==
X-Received: by 2002:a17:902:ab81:: with SMTP id
 f1mr15266267plr.5.1580661582239; 
 Sun, 02 Feb 2020 08:39:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k1sm18045122pfg.66.2020.02.02.08.39.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Feb 2020 08:39:41 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ARM: dts: aspeed: tacoma: Enable eMMC controller
Date: Sun,  2 Feb 2020 08:39:39 -0800
Message-Id: <20200202163939.13326-1-linux@roeck-us.net>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enabling emmc without enabling its controller doesn't do any good.
Enable its controller as well to make it work.

Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index ff49ec76fa7c..47293a5e0c59 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -132,6 +132,10 @@
 	use-ncsi;
 };
 
+&emmc_controller {
+	status = "okay";
+};
+
 &emmc {
 	status = "okay";
 };
-- 
2.17.1

