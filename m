Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B997A537B
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 22:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqG9Q4f4Dz3cCT
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Sep 2023 06:09:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqG9H5wKTz3byh
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Sep 2023 06:09:39 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHB-0003kL-K7; Mon, 18 Sep 2023 21:51:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH7-007I8N-8m; Mon, 18 Sep 2023 21:51:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH6-002mBz-U1; Mon, 18 Sep 2023 21:51:16 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 00/19] net: mdio: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:50:43 +0200
Message-Id: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ci0IQrSWXNAJYKg8fc1qgrDF2J0dg2FQPcKK5IFoxug=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKn/qrkWkMR4vATlu8+A8buQtn/uucJFCz2Je IMvpamj1JiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQip/wAKCRCPgPtYfRL+ TgI/CACwpYaVqL2xrOfAhNBLFfB1xVWtYI9VnYPr9stjtL6MTwB9J8cCGV9AZ3kzuvv+WH2Q4rZ 5FI4J3XS7U+/FYU0H3YQQc8TeWJY7Ox15+3DAeFd/J47vAxI040iarzF8Lk1UibG4xlKxeVr/74 7OMIbUZCi0mjPMQzdIUufaXP2vm7IHBsNE5VYDr7pvT1vJixcOEeTtR39oDZmpUGLmjXxJ4FFoZ 80e2dl5Wg/6Lwr0APE2IqAMytjXfRhdW1z8fS7axIlH1JcZePE2Vpwf3V62ohnleM1St4kJJ40I D0TiIGRs/l1V3FjneArpH8rCY8lPmB0ET/0iO0ny4VYL9Wy8
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
Cc: linux-aspeed@lists.ozlabs.org, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Jerome Brunet <jbrunet@baylibre.com>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David
  S. Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

this series convert all platform drivers below drivers/net/mdio to
use remove_new. The motivation is to get rid of an integer return code
that is (mostly) ignored by the platform driver core and error prone on
the driver side.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply, please apply the remainder of this series anyhow.

Best regards
Uwe

Uwe Kleine-König (19):
  net: mdio: aspeed: Convert to platform remove callback returning void
  net: mdio: bcm-iproc: Convert to platform remove callback returning
    void
  net: mdio: bcm-unimac: Convert to platform remove callback returning
    void
  net: mdio: gpio: Convert to platform remove callback returning void
  net: mdio: hisi-femac: Convert to platform remove callback returning
    void
  net: mdio: ipq4019: Convert to platform remove callback returning void
  net: mdio: ipq8064: Convert to platform remove callback returning void
  net: mdio: moxart: Convert to platform remove callback returning void
  net: mdio: mscc-miim: Convert to platform remove callback returning
    void
  net: mdio: mux-bcm-iproc: Convert to platform remove callback
    returning void
  net: mdio: mux-bcm6368: Convert to platform remove callback returning
    void
  net: mdio: mux-gpio: Convert to platform remove callback returning
    void
  net: mdio: mux-meson-g12a: Convert to platform remove callback
    returning void
  net: mdio: mux-meson-gxl: Convert to platform remove callback
    returning void
  net: mdio: mux-mmioreg: Convert to platform remove callback returning
    void
  net: mdio: mux-multiplexer: Convert to platform remove callback
    returning void
  net: mdio: octeon: Convert to platform remove callback returning void
  net: mdio: sun4i: Convert to platform remove callback returning void
  net: mdio: xgene: Convert to platform remove callback returning void

 drivers/net/mdio/mdio-aspeed.c          | 6 ++----
 drivers/net/mdio/mdio-bcm-iproc.c       | 6 ++----
 drivers/net/mdio/mdio-bcm-unimac.c      | 6 ++----
 drivers/net/mdio/mdio-gpio.c            | 6 ++----
 drivers/net/mdio/mdio-hisi-femac.c      | 6 ++----
 drivers/net/mdio/mdio-ipq4019.c         | 6 ++----
 drivers/net/mdio/mdio-ipq8064.c         | 7 ++-----
 drivers/net/mdio/mdio-moxart.c          | 6 ++----
 drivers/net/mdio/mdio-mscc-miim.c       | 6 ++----
 drivers/net/mdio/mdio-mux-bcm-iproc.c   | 6 ++----
 drivers/net/mdio/mdio-mux-bcm6368.c     | 6 ++----
 drivers/net/mdio/mdio-mux-gpio.c        | 5 ++---
 drivers/net/mdio/mdio-mux-meson-g12a.c  | 6 ++----
 drivers/net/mdio/mdio-mux-meson-gxl.c   | 6 ++----
 drivers/net/mdio/mdio-mux-mmioreg.c     | 6 ++----
 drivers/net/mdio/mdio-mux-multiplexer.c | 6 ++----
 drivers/net/mdio/mdio-octeon.c          | 5 ++---
 drivers/net/mdio/mdio-sun4i.c           | 6 ++----
 drivers/net/mdio/mdio-xgene.c           | 6 ++----
 19 files changed, 38 insertions(+), 75 deletions(-)

base-commit: 7fc7222d9680366edeecc219c21ca96310bdbc10
-- 
2.40.1

