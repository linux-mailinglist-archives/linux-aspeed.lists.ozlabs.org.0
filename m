Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0D1872952
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Mar 2024 22:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq7mR1WLmz3vgd
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Mar 2024 08:21:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq7mK6N27z3vXX
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Mar 2024 08:21:37 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcDl-00031I-IY; Tue, 05 Mar 2024 22:21:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcDj-004cl3-1N; Tue, 05 Mar 2024 22:21:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhcDi-000IBl-33;
	Tue, 05 Mar 2024 22:21:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jeremy Kerr <jk@ozlabs.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/4] fsi: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 22:20:56 +0100
Message-ID: <cover.1709673414.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ALrT5iPjhPF2e0OAtNyJHyeupWkX4xgVJhjIcoPt7aA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl54y5USG3GCDAJeJVKFmORPHpJ+3uT0bBAhfkd guJcPbwhwSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeeMuQAKCRCPgPtYfRL+ TvilB/9KyvpiOOtoPxYaaFE6DbdLe3/BWYjWfFO0OOVz+0H7AZffqnSBIGzU6Y4sZ5nFzrvWJxx QV5nFrVtEE1Md96FKz9x5pgqt63mZMX4YbczVVVqVURa7bV/AvA+wuPN57aF5Ru7PDKxUem6Nxg R32DQ9jUGY5VEuL4saH4BmnoorOxIhHq/hYLNn2iyyVJ/HIlTmG9EOCberZluiqkTDoe6BjwIq/ LtwbxRusAuJXabqprSsGAFkkTONziF1p7vYyFpX/S+92L/zuna2ljJ/ScZCgCcLysJMT4AtlaWS sjwBy29WB49Fp6UrNr3tmR/cSyvyK2yDk+9C60IvWJp2zAQo
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
Cc: linux-aspeed@lists.ozlabs.org, Alistar Popple <alistair@popple.id.au>, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all drivers below drivers/fsi to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
Provide a remove callback that returns no value") for an extended
explanation and the eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together.

Best regards
Uwe

Uwe Kleine-König (4):
  fsi: master-aspeed: Convert to platform remove callback returning void
  fsi: master-ast-cf: Convert to platform remove callback returning void
  fsi: master-gpio: Convert to platform remove callback returning void
  fsi: occ: Convert to platform remove callback returning void

 drivers/fsi/fsi-master-aspeed.c | 6 ++----
 drivers/fsi/fsi-master-ast-cf.c | 6 ++----
 drivers/fsi/fsi-master-gpio.c   | 6 ++----
 drivers/fsi/fsi-occ.c           | 6 ++----
 4 files changed, 8 insertions(+), 16 deletions(-)

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0

