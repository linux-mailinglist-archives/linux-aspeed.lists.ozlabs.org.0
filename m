Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CE11FF43
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 08:56:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47btqz3FcqzDqTs
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 18:55:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="B+V2ZbgO"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47btqr6dHJzDqSR
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 18:55:46 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A5EAD43B4E;
 Mon, 16 Dec 2019 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1576482940;
 x=1578297341; bh=BWfwqYX21S2KCFxyZoimHOBsY3YUgME5n7pLkWB60bE=; b=
 B+V2ZbgOx+qPVvZsiFz2PdKkhU81IxBp4SDALFFClriCfZzrKvVM2HZbPf325V4r
 QmOifWLexJldu0z/Wef2gRJaSBMjU/DZGgUPx+MYqaRXtYdnDnHWXZWyJpONfTWz
 CR93bmQbZga3Z7+W47xJ5Q8RX3CBmUqNI4kHTQR9X3M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNlYISM0A_mb; Mon, 16 Dec 2019 10:55:40 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3E66E411FF;
 Mon, 16 Dec 2019 10:55:40 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Dec 2019 10:55:39 +0300
Date: Mon, 16 Dec 2019 10:55:39 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: AST2400 disables hw checksum
Message-ID: <20191216075539.GA13054@bbwork.lan>
References: <20191216064132.78015-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20191216064132.78015-1-joel@jms.id.au>
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
Cc: Alexander Filippov <a.filippov@yadro.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Reviewed-by: Alexander Filippov <a.filippov@yadro.com>

On Mon, Dec 16, 2019 at 05:41:32PM +1100, Joel Stanley wrote:
> There is no need to specify this property in the device tree as the
> AST2400 does not have working hardware checksum and disables it in the
> driver.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts | 1 -
>  arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  | 1 -
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        | 3 ---
>  3 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> index b1e10f0c85c9..322587b7b67d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> @@ -76,7 +76,6 @@ &uart5 {
>  
>  &mac1 {
>  	status = "okay";
> -	no-hw-checksum;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> index aaa77a597d1a..54e508530dce 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> @@ -75,7 +75,6 @@ &uart5 {
>  
>  &mac1 {
>  	status = "okay";
> -	no-hw-checksum;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> index affd2c8743b1..041f28e3ac10 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> @@ -107,10 +107,7 @@ flash@0 {
>  
>  &mac0 {
>  	status = "okay";
> -
>  	use-ncsi;
> -	no-hw-checksum;
> -
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rmii1_default>;
>  };
> -- 
> 2.24.0
> 
