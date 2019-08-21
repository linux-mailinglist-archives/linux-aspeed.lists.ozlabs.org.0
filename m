Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21FA734D
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:13:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGng1rnNzDqlg
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:13:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="XuASEHZZ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DBxl2221zDqjp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 01:52:27 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2E05142ED0;
 Wed, 21 Aug 2019 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1566402743;
 x=1568217144; bh=pOc3KLiQCgqwQcr8n6hsHD5m1EFrOU7bcNFQtatabT8=; b=
 XuASEHZZRwvvUATkU2u1FcGIrD4HSAQKr07D8arfRKO8d3PH4qoMl113V/7VG+qt
 DFvR4RSpUEGrdWp5nnKj6cizV5AaCtOdq83kVRJ3xEm7rxLJc6xVc862i9q+47mr
 NfHev9oMvRc3WK1Nkm5/pAJnatYzgwjPBFT1CoMBivo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SUR6-yrjwhX; Wed, 21 Aug 2019 18:52:23 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E51774120B;
 Wed, 21 Aug 2019 18:52:22 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 21 Aug 2019 18:52:22 +0300
Message-ID: <f27c52df7ddd460695d6ed1d7823a65a72012361.camel@yadro.com>
Subject: [PATCH 0/3] add dual-boot support
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>
Date: Wed, 21 Aug 2019 18:52:22 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:13 +1000
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Alexander
 Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

ASPEED SoCs support dual-boot feature for SPI Flash.
When strapped appropriately, the SoC starts wdt2 (/dev/watchdog1)
and if within a minute it is not disabled, it goes off and reboots
the SoC from an alternate SPI Flash chip by changing CS0 controls
to actually drive CS1 line.

When booted from alternate chip, in order to access the main chip
at CS0, the user must reset the appropriate bit in the watchdog
hardware. There is no interface that would allow to do that from
an embedded firmware startup script.

This commit implements support for that feature:

* Enable 'alt-boot' option for wdt2

* Enable secondary SPI flash chip

* Make it possible to get access to the primary SPI flash chip at CS0
  after booting from the alternate chip at CS1. A sysfs interface is added
  to provide an easy way for embedded firmware startup scripts to clear
  the chip select bit to gain access to the primary flash chip in order
  to allow for recovery of its contents.

Ivan Mikhaylov (3):
  vesnin: add wdt2 section with alt-boot option
  vesnin: add secondary SPI flash chip
  watchdog/aspeed: add support for dual boot

 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 12 +++++++++
 drivers/watchdog/aspeed_wdt.c               | 30 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.20.1


