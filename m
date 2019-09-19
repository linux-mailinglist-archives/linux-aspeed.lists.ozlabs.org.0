Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51536D075F
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:42:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4QH3qXrzDqKr
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:42:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=vigneshr@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="oop+2cl0"; 
 dkim-atps=neutral
X-Greylist: delayed 55715 seconds by postgrey-1.36 at bilbo;
 Fri, 20 Sep 2019 16:06:42 AEST
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZNX2133fzF3Q5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 16:06:39 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JEbetv115088;
 Thu, 19 Sep 2019 09:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568903860;
 bh=MF3qsuF4n+o3m2uSbnHwtbN88u+xehQfFPTradyvPmM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oop+2cl0Z5hydQEOc7aJzKOUC8+y7z7JdhpUZQ48FCxXjOkcMZ1L5BFe22g4abjTm
 aGkkCdJjvzrRTBkmVIECVwkY1WTc1zljyPyknqsjQzIVpNZ3t864me2KvRHSmox9Uz
 lMXRFJyZDKSGM4Eh+6J7GPgsT5E2l92r0G3JPUxA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JEbd4H073219
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Sep 2019 09:37:40 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 09:37:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 09:37:39 -0500
Received: from [10.250.132.15] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JEbYUO049208;
 Thu, 19 Sep 2019 09:37:35 -0500
Subject: Re: [PATCH 00/23] mtd: spi-nor: Quad Enable and (un)lock methods
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <920a9946-af0d-1190-d59c-0b4acee71931@ti.com>
Date: Thu, 19 Sep 2019 20:07:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:38 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On 17-Sep-19 9:24 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
[...]
> Tudor Ambarus (23):
>   mtd: spi-nor: hisi-sfc: Drop nor->erase NULL assignment
>   mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'
>   mtd: spi-nor: cadence-quadspi: Fix cqspi_command_read() definition
>   mtd: spi-nor: Rename nor->params to nor->flash
>   mtd: spi-nor: Rework read_sr()
>   mtd: spi-nor: Rework read_fsr()
>   mtd: spi-nor: Rework read_cr()
>   mtd: spi-nor: Rework write_enable/disable()
>   mtd: spi-nor: Fix retlen handling in sst_write()
>   mtd: spi-nor: Rework write_sr()
>   mtd: spi-nor: Rework spi_nor_read/write_sr2()
>   mtd: spi-nor: Report error in spi_nor_xread_sr()
>   mtd: spi-nor: Void return type for spi_nor_clear_sr/fsr()
>   mtd: spi-nor: Drop duplicated new line
>   mtd: spi-nor: Drop spansion_quad_enable()
>   mtd: spi-nor: Fix errno on quad_enable methods
>   mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()
>   mtd: spi-nor: Rework macronix_quad_enable()
>   mtd: spi-nor: Rework spansion(_no)_read_cr_quad_enable()
>   mtd: spi-nor: Update sr2_bit7_quad_enable()
>   mtd: spi-nor: Rework the disabling of block write protection
>   mtd: spi-nor: Add Global Block Unlock support
>   mtd: spi-nor: Unlock global block protection on sst26vf064b

With whole series applied, I see:

drivers/mtd/spi-nor/spi-nor.c:520: warning: Function parameter or member 'cr' not described in 'spi_nor_read_cr'
drivers/mtd/spi-nor/spi-nor.c:520: warning: Excess function parameter 'fsr' description in 'spi_nor_read_cr'
drivers/mtd/spi-nor/spi-nor.c:742: warning: Function parameter or member 'len' not described in 'spi_nor_write_sr'
drivers/mtd/spi-nor/spi-nor.c:889: warning: Function parameter or member 'status_new' not described in 'spi_nor_write_sr1_and_check'
drivers/mtd/spi-nor/spi-nor.c:889: warning: Function parameter or member 'mask' not described in 'spi_nor_write_sr1_and_check'
drivers/mtd/spi-nor/spi-nor.c:923: warning: Function parameter or member 'status_new' not described in 'spi_nor_write_16bit_sr_and_check'
drivers/mtd/spi-nor/spi-nor.c:923: warning: Function parameter or member 'mask' not described in 'spi_nor_write_16bit_sr_and_check'
drivers/mtd/spi-nor/spi-nor.c:997: warning: Function parameter or member 'status_new' not described in 'spi_nor_write_sr_and_check'
drivers/mtd/spi-nor/spi-nor.c:997: warning: Function parameter or member 'mask' not described in 'spi_nor_write_sr_and_check'

Could you please fix up docs next time around?

Regards
Vignesh
> 
>  drivers/mtd/spi-nor/aspeed-smc.c      |   23 +-
>  drivers/mtd/spi-nor/cadence-quadspi.c |   54 +-
>  drivers/mtd/spi-nor/hisi-sfc.c        |   23 +-
>  drivers/mtd/spi-nor/intel-spi.c       |   24 +-
>  drivers/mtd/spi-nor/mtk-quadspi.c     |   25 +-
>  drivers/mtd/spi-nor/nxp-spifi.c       |   23 +-
>  drivers/mtd/spi-nor/spi-nor.c         | 1697 ++++++++++++++++++---------------
>  include/linux/mtd/spi-nor.h           |   75 +-
>  8 files changed, 1050 insertions(+), 894 deletions(-)
> 
