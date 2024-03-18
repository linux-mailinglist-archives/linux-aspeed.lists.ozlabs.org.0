Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F687ED8B
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Mar 2024 17:28:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz0fC5rhKz3vlS
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Mar 2024 03:28:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz0dy0Y1Dz3vhn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Mar 2024 03:28:20 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmFqA-0007vL-3z; Mon, 18 Mar 2024 17:27:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmFq6-00771H-UX; Mon, 18 Mar 2024 17:27:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmFq6-0084a7-2h;
	Mon, 18 Mar 2024 17:27:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] hwmon: (aspeed-g6-pwm-tacho): Prepare for further pwm core changes
Date: Mon, 18 Mar 2024 17:09:48 +0100
Message-ID: <cover.1710777536.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=s9JicVFj4pJmGVVQ4r+P90evKiT5bMKtXEpV6/oPFI8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl+GdNy9W4Yul+TxF6AO3lEUVPIz9Vovisop+ib w/mSgiPXhOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfhnTQAKCRCPgPtYfRL+ To38B/9RPIoE7KfD1gvs8Lx052TFmKt/pZgu8+BvKF+vNlAkstLnm5l4Lag4Mv16X0ryqsCfYrQ bioPj+vf4b/GKri5eDBDT1jGALIpcWPYMPHmo7fVWSe8NS9YjhuvnUaTf02eTX6u6cZ2mJKM2rB LeP/6I5/qjMX+gA6Av8s5jiW7Gu9rjuD6YwqoDmdfZ2c7tQZVYPVywnHVM7miZJkxOSJ+MzmNDu q3dE0nzCoGsUrFf019MrXUulcprnnCQQXmzkolUXG5qU4WqHSF+n9A9SVXc8RHfkYcSsWkqf3Ed qODGN2RWmNoK6gpz1Y/c7M4EV4m54agLGpZLz32r0GyD+tJk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

there is a pending rework for the pwm framework[1] that requires a
preparatory change for all pwm drivers. When creating them I wasn't
aware of the aspeed-g6-pwm-tacho driver, just found this now while doing
build tests with my series.

To not delay application of my series, I'd like to take the two patches
from this series via my pwm tree.

To state the (maybe) obvious: This series depends on the following commits:

	7e1449cd15d1 "hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach"
	024913dbf99f pwm: Provide pwmchip_alloc() function and a devm variant of it
	4e59267c7a20 pwm: Provide an inline function to get the parent device of a given chip

The earliest commit containing all those is:

	15223fdbdf4f "Merge tag 'hwmon-for-v6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging"

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/cover.1710670958.git.u.kleine-koenig@pengutronix.de

Uwe Kleine-König (2):
  hwmon: (aspeed-g6-pwm-tacho): Make use of pwmchip_parent() accessor
  hwmon: (aspeed-g6-pwm-tacho): Make use of devm_pwmchip_alloc()
    function

 drivers/hwmon/aspeed-g6-pwm-tach.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

base-commit: f6cef5f8c37f58a3bc95b3754c3ae98e086631ca
-- 
2.43.0

