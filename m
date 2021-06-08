Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800C39EEDF
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 08:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzgjC3Gfqz3014
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 16:45:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=billy_tsai@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzgj572r1z2xvP
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 16:45:11 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1586UuVe088772;
 Tue, 8 Jun 2021 14:30:56 +0800 (GMT-8)
 (envelope-from billy_tsai@aspeedtech.com)
Received: from BillyTsai-pc.aspeed.com (192.168.2.149) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 14:44:45 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <p.zabel@pengutronix.de>,
 <billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>
Subject: [v8 0/2] Support pwm driver for aspeed ast26xx
Date: Tue, 8 Jun 2021 14:46:56 +0800
Message-ID: <20210608064658.14262-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.149]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1586UuVe088772
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

The legacy driver of aspeed pwm is binding with tach controller and it
doesn't follow the pwm framworks usage. In addition, the pwm register
usage of the 6th generation of ast26xx has drastic change. So these
patch serials add the new aspeed pwm driver to fix up the problem above.

Change since v7:
- pwm-aspeed-g6.c
  - Rename the driver: pwm-aspeed-g6.c -> pwm-aspeed-ast2600.c.
  - Macro remove "_CH" part of the register name.
  - Unroll the aspeed_pwm_get_period and remove it.
  - Simplify the formula to get duty_pt
  - Reduce the number of writting register. Organize all the fields and
    write them at once.

Change since v6:
- dt-bindings:
  - Add blank line between each DT property.
  - Change the sub-node name from fan to tach-ch.
- pwm-aspeed-g6.c
  - Merge aspeed_pwm_set_period and aspeed_pwm_set_duty into .apply.
  - Convert the factor type to u64 when calculating the period value.
  - Using ROUND_UP strategy to calculate div_h for finer resolution.

Change since v5:
- pwm-aspeed-g6.c suggested by Uwe Kleine-König
  - Move the divide at the end of the calculation.
  - Unified the prefix of the function name.
  - Use div64_u64 to calculate the divider of frequency.

Change since v4:
- dt_binding:
  - pwm/tach yaml: Replace child-node with additionalProperties
  - pwm-tach yaml: Replace child-node with patternProperties
- pwm-aspeed-g6.c suggested by Uwe Kleine-König
  - The bit definitions contained the name of the register.
  - Remove single caller function and fold it to the caller.
  - Avoid to divide by the result of a division.
  - Remove unnecessary condition in .apply().
  - Use goto for error handling

Changes since v3:
- Add the dt_binding for aspeed,ast2600-tach.
- Describe the pwm/tach as child-node of pwm-tach mfd.
- Complete the properties of pwm node.

Changes since v2:
- Remove the tach node, #address-cells and #size-cells from pwm-tach.yaml
- Add clocks and reset properties to pwm-tach.yaml
- Kconfig/Makfile sorted alphabetically
- pwm-aspeed-g6.c suggested by Uwe Kleine-König
  - Add more hardware descriptions at top of the driver.
  - Remove unused api request and free
  - Move the initialize settings of all pwm channel to probe.
  - Change the method of getting the approximate period.
  - Read the hardware register values to fill the state for .get_state()

Changes since v1:
- Fix the dt_binding_check fail suggested by Rob Herring
- Add depends to PWM_ASPEED_G6 configure suggested by Uwe Kleine-Konig
- pwm-aspeed-g6.c suggested by Uwe Kleine-König
  - Fix license header
  - Use bitfiled.h macro to define register fields
  - Implement .remove device function
  - Implement .get_state pwm api

Billy Tsai (2):
  dt-bindings: Add bindings for aspeed pwm-tach.
  pwm: Add Aspeed ast2600 PWM support

 .../bindings/hwmon/aspeed,ast2600-tach.yaml   |  69 ++++
 .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml |  87 +++++
 .../bindings/pwm/aspeed,ast2600-pwm.yaml      |  64 ++++
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-aspeed-ast2600.c              | 311 ++++++++++++++++++
 6 files changed, 541 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-aspeed-ast2600.c

-- 
2.25.1

