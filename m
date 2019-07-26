Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E576039
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 09:57:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w1dL5xzVzDqP1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 17:57:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="hpcgBbvB"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w1dC6l9LzDqBb
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 17:57:00 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2AB0A412D2;
 Fri, 26 Jul 2019 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1564127814; x=1565942215; bh=t7R6X8nvFz+0QciEa3VrF8VwhbSoAtsuItD
 wYQ0loc4=; b=hpcgBbvByqr1Xb893BxdoU1Cbaaf36vBPH9hCTucba2X0xOPeyb
 O0RdOn5CcQzjxevvIR7J7f0PsQG+BICWXFCRKWdoRA/Uk2dHCcxvOrz3ATANxP6e
 EdLoB6R8qbQMg0lDsbc/25vKxrFDq+YySIcgsNhCuA4L5+oMhrH/DmPQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJyaxH08dzGi; Fri, 26 Jul 2019 10:56:54 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0BB6741185;
 Fri, 26 Jul 2019 10:56:53 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 26
 Jul 2019 10:56:53 +0300
Date: Fri, 26 Jul 2019 10:56:53 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 04/17] ARM: dts: vesnin: Add unit address for memory node
Message-ID: <20190726075653.GA10397@bbwork.lan>
References: <20190726053959.2003-1-andrew@aj.id.au>
 <20190726053959.2003-5-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20190726053959.2003-5-andrew@aj.id.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Alexander Filippov <a.filippov@yadro.com>, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2019 at 03:09:46PM +0930, Andrew Jeffery wrote:
> Fixes the following warnings:
> 
>     arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml: /: memory: False schema does not allow {'reg': [[1073741824, 536870912]]}
>     arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml: memory: 'device_type' is a required property
> 
> Cc: Alexander Filippov <a.filippov@yadro.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> index 0b9e29c3212e..81d9dcb752a0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> @@ -14,7 +14,7 @@
>  		bootargs = "console=ttyS4,115200 earlyprintk";
>  	};
>  
> -	memory {
> +	memory@40000000 {
>  		reg = <0x40000000 0x20000000>;
>  	};
>  
> -- 
> 2.20.1
> 

Tested-by: Alexander Filippov <a.filippov@yadro.com>
