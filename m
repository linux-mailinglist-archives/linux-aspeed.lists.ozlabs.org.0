Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7C7CD92
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 22:02:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zPVC6PFqzDqlZ
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2019 06:02:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zPTN6hNHzDqlR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2019 06:01:57 +1000 (AEST)
X-AuditID: ac10606f-d11ff70000003324-8e-5d41f3b03e75
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 A3.A0.13092.0B3F14D5; Wed, 31 Jul 2019 16:01:52 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 31 Jul 2019 16:01:51 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [v7 0/2] gpio: aspeed: Add SGPIO driver
Date: Wed, 31 Jul 2019 16:01:35 -0400
Message-ID: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWyRiBhgu6Gz46xBiuaDCx2Xeaw+DL3FIvF
 /CPnWC1+n//LbDHlz3Imi02Pr7FaNK8+x2yxef4fRovLu+awWSy9fpHJonXvEXYHbo+r7bvY
 PdbMW8Po8f5GK7vHxY/HmD02repk87hzbQ+bx+Yl9R7nZyxk9Pi8SS6AM4rLJiU1J7MstUjf
 LoEro/vcBPaCp+wV/9+fZWxgbGXrYuTkkBAwkbi3A8Tm4hAS2MUkMevfBWYI5zCjxISf35hA
 qtgE1CT2bp4DZosI5EkcXv+WFaSIWeAUk8SMfZ2sIAlhAQOJee1zmUFsFgFViXN774A18ArY
 S2z7t54JYp2cxM1zncwQcUGJkzOfsIDYzAISEgdfvACLCwnIStw69BiqXkHied9jlgmMfLOQ
 tMxC0rKAkWkVo1BiSU5uYmZOermRXmJupl5yfu4mRkiY5+9g/PjR/BAjEwfjIUYJDmYlEd7F
 4vaxQrwpiZVVqUX58UWlOanFhxilOViUxHlXrfkWIySQnliSmp2aWpBaBJNl4uCUamBMaLqf
 pOM6K2tCuYtvEJNQYAuvlt7pF3e95T/kJbtu27Pxy7fUhyXM3Hy3s2q9Fx11KzBwkpD+umnN
 eReHLWoJjx69ei3C1pt0pae8k/2X0v5cfnOJnh8n2W55Fs1eeG+X1cNuMbY910UL//x1lvL4
 3yv4Z5V+wC6+vywlPtPl+t1LVFN/dymxFGckGmoxFxUnAgB+9vPoYQIAAA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <hongweiz@ami.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This short series introduce dt-binding document and a driver for the 
Aspeed AST2500 SGPIO controller. Please review.

[v7]:   Changes between v6 and v7:
        - fix missing variable 'reg' assign issue in aspeed_sgpio_set()
        - v6 feedback updates

[v6]:   Changes between v5 and v6:
        - fix a bug in aspeed_sgpio_dir_out()
        - v5 feedback updates, some comments cleanup

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/

Hongwei Zhang (2):
  dt-bindings: gpio: aspeed: Add SGPIO support
  gpio: aspeed: Add SGPIO driver

 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |  55 +++
 drivers/gpio/sgpio-aspeed.c                        | 530 +++++++++++++++++++++
 2 files changed, 585 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 drivers/gpio/sgpio-aspeed.c

-- 
2.7.4

