Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8C500B16
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Apr 2022 12:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfG013ygsz305j
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Apr 2022 20:28:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfFzy67Y1z2xVY;
 Thu, 14 Apr 2022 20:28:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23EAGooP068168;
 Thu, 14 Apr 2022 18:16:50 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Apr
 2022 18:28:36 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH 0/1] spi: aspeed: Update SPI clock frequency configuration
Date: Thu, 14 Apr 2022 18:28:28 +0800
Message-ID: <20220414102829.3892843-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23EAGooP068168
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series aims to update SPI clock frequency
configuration rule and add SPI clock frequency
calculation method for different ASPEED platforms.

This patch is based on [1] and the patch series [2].
[1]: https://github.com/legoater/linux/commits/openbmc-5.15
[2]: https://patchwork.kernel.org/project/spi-devel-general/list/?series=626283


Chin-Ting Kuo (1):
  spi: aspeed: Update SPI clock frequency configuration

 drivers/spi/spi-aspeed-smc.c | 166 +++++++++++++++++++++++++++++++----
 1 file changed, 149 insertions(+), 17 deletions(-)

-- 
2.25.1

