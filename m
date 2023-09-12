Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F8E79DBBC
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 00:16:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hn2YVqcb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RldG706jJz3cVv
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Sep 2023 08:16:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RldFr3Wtnz30PY
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 08:15:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NIxqE6FO3o0CdOEr4cjgDYr7N/uQ/DrL4AkGZwEHTu8=; b=hn2YVqcbHWqeqqP7MmMWcU3nEn
	0el62pWkKyH9Fwy/jU8ypzwa2Zp5VRK2ogfpTiRd+97hTCnzI1Qy6edA4E7+Ca6aKmANUpPI2JqRl
	lRiw2GAD+hFW201bCqdYgMy9UQCjuX6tufNX5FeuCEIEPXe5wWScQ+994znoQyk+C8eZxc3RzfOwk
	MV7ADONj34KUhicu/sDg7cai3DXZRPO5k9lNtibLjYI2jraLtcFepWJt8hdPbI3VzPq7Yjeulkwwp
	SYLPd7Z18+PxVrV1BrBJBllRScDQ40EsCG2Wptn+Cqc/4Tb35R+BBb6/XK9//iLQr68piTe6T3pPf
	3BskT9jA==;
Received: from [2601:1c2:980:9ec0::9fed]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qgBfi-004B9h-0V;
	Tue, 12 Sep 2023 22:15:50 +0000
Message-ID: <c3981a8d-de56-448d-adb5-6685530b85f7@infradead.org>
Date: Tue, 12 Sep 2023 15:15:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc/aspeed: Add host side BMC device driver
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 eajames@linux.ibm.com
References: <20230912220923.3701688-1-ninad@linux.ibm.com>
 <20230912220923.3701688-2-ninad@linux.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230912220923.3701688-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..8a4f096d84cd 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -52,6 +52,17 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
+config ASPEED_HOST_BMC_DEV
+	bool "ASPEED SoC Host BMC device driver"
+	select SOC_BUS
+	default ARCH_ASPEED
+	depends on PCI
+	help
+	  Say yes to support PCIe based VUARTs from the host side. The end to
+          end VUART communication between host and BMC requires BMC side driver
+	  to activate VUART functionality. This is a driver for the BMC device
+          on host.

~~~
Please clean up that indentation. Consistently use one tab + 2 spaces,
as documented in coding-style.rst.

Also, can this be tristate instead of bool?  If not, why not?

Thanks.
-- 
~Randy
