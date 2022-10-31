Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F676133BC
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Oct 2022 11:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N18jz3H3Sz3c3V
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Oct 2022 21:37:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N18jp0qybz3c25
	for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Oct 2022 21:37:32 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 29VADXEh074630;
	Mon, 31 Oct 2022 18:13:33 +0800 (GMT-8)
	(envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 Oct
 2022 18:36:38 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <joel@jms.id.au>, <andrew@aj.id.au>, <lee.jones@linaro.org>,
        <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
        <p.zabel@pengutronix.de>, <billy_tsai@aspeedtech.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
        <garnermic@meta.com>
Subject: [PATCH 0/3] Support pwm/tach driver for aspeed ast26xx
Date: Mon, 31 Oct 2022 18:38:05 +0800
Message-ID: <20221031103809.20225-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29VADXEh074630
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Unlike the old design that the register setting of the TACH should based
on the configure of the PWM. In ast26xx, the dependency between pwm and
tach controller is eliminated and becomes a separate hardware block. One
is used to provide pwm output and another is used to monitor the frequency
of the input. Therefore, this patch serials implements them by writing the
two driver "pwm-aspeed-ast2600.c" and "tach-aspeed-ast2600.c". The former
is following the pwm subsystem which can apply the existed driver to
controller the fan(pwm-fan.c), beeper(pwm-beeper.c) and so on. The latter
is following the sysfs interface of hwmon to creat the node for fan
monitor.

Billy Tsai (3):
  dt-bindings: Add bindings for aspeed pwm-tach.
  pwm: Add Aspeed ast2600 PWM support
  hwmon: Add Aspeed ast2600 TACH support

 .../bindings/hwmon/aspeed,ast2600-tach.yaml   |  48 ++
 .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml |  76 ++
 .../bindings/pwm/aspeed,ast2600-pwm.yaml      |  64 ++
 drivers/hwmon/Kconfig                         |   9 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tach-aspeed-ast2600.c           | 692 ++++++++++++++++++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-aspeed-ast2600.c              | 325 ++++++++
 9 files changed, 1226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
 create mode 100644 drivers/hwmon/tach-aspeed-ast2600.c
 create mode 100644 drivers/pwm/pwm-aspeed-ast2600.c

-- 
2.25.1

