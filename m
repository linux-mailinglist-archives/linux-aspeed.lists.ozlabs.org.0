Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F330849
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 08:07:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FYs21FqdzDqXt
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 16:07:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="wD9JZsv4"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FYrq631szDqVf
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2019 16:07:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4B3A44196A;
 Fri, 31 May 2019 06:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1559282853; x=1561097254; bh=aP/v8Ti3LcvTQfv2gGn+BqK/Tdgk+/cwBCm
 +uXIEhhs=; b=wD9JZsv4lyaVNK+ct7ZaeDLknftLzxvLWSIqh8Diw6IZ2YuMo/y
 a2i4VZPvDOpFEEWNxtI7dIQZ0ooZDHHVi9w78KLhbKH4jzaXPBuMbnQzMt0SEvAD
 vkDSPRD64FzunuFWpunrW9UqNzIE2IAPSbptqxYOBlKKj+4vD+QS60IE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vd6-wKmfLZdQ; Fri, 31 May 2019 09:07:33 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 64D7741860;
 Fri, 31 May 2019 09:07:32 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 31
 May 2019 09:07:32 +0300
Date: Fri, 31 May 2019 09:07:31 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add YADRO VESNIN BMC
Message-ID: <20190531060731.GA22597@bbwork.lan>
References: <20190530143933.25414-1-a.filippov@yadro.com>
 <20190530203653.GD1561@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20190530203653.GD1561@lunn.ch>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
 Rob Herring <robh+dt@kernel.org>, Alexander Filippov <a.filippov@yadro.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 10:36:53PM +0200, Andrew Lunn wrote:
> On Thu, May 30, 2019 at 05:39:33PM +0300, Alexander Filippov wrote:
> > VESNIN is an OpenPower machine with an Aspeed 2400 BMC SoC manufactured
> > by YADRO.
> > 
> > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> > ---
> >  arch/arm/boot/dts/Makefile                  |   1 +
> >  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 234 ++++++++++++++++++++
> >  2 files changed, 235 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 834cce80d1b8..811e9312cf22 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1259,6 +1259,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >  	aspeed-bmc-microsoft-olympus.dtb \
> >  	aspeed-bmc-opp-lanyang.dtb \
> >  	aspeed-bmc-opp-palmetto.dtb \
> > +	aspeed-bmc-opp-vesnin.dtb \
> >  	aspeed-bmc-opp-romulus.dtb \
> >  	aspeed-bmc-opp-swift.dtb \
> >  	aspeed-bmc-opp-witherspoon.dtb \
> 
> Hi Alexander

Hi Andrew,

> 
> Still not correctly sorted.
> 

Thanks, I've fixed it in V3

>       Andrew
