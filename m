Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F13929A0
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 10:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrLgM4ZB7z2ylk
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 18:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=HkeMxzHE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=HkeMxzHE; dkim-atps=neutral
X-Greylist: delayed 473 seconds by postgrey-1.36 at boromir;
 Thu, 27 May 2021 18:33:15 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrLgH0K5bz2yYK
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 18:33:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 18ECF412ED;
 Thu, 27 May 2021 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1622103914;
 x=1623918315; bh=amPBFNwL/yHzAYtGD+ycONErr2GEa79ITJzbaL/4KS4=; b=
 HkeMxzHEtLfVulO7Om/gY05v7Z3SPRcq7Z0foKf0wFld4x79BPy2SB1LSRHykb8c
 2YxyMD1qY4J7hvMsxJQBT4cQVpbmPkjVCc912ZBgzEDQmj2/rHYu3hpikrP9P0dx
 0DqJ37/5V271UbwRLkh+xesoRxshm6nuBgg2flcjtxo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhFiPojF7kj7; Thu, 27 May 2021 11:25:14 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 46C9C411FB;
 Thu, 27 May 2021 11:24:58 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 27
 May 2021 11:24:58 +0300
Date: Thu, 27 May 2021 11:24:57 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Set earlycon boot argument
Message-ID: <YK9XWcdrMK7Tz0Ph@nbwork.lan>
References: <20210526051220.136432-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210526051220.136432-1-joel@jms.id.au>
X-Originating-IP: [172.17.1.114]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: linux-aspeed@lists.ozlabs.org, Quan Nguyen <quan@os.amperecomputing.com>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
 Ryan Sie <ryans@supermicro.com.tw>, Zev Weiss <zev@bewilderbeest.net>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 linux-arm-kernel@lists.infradead.org, Xo Wang <xow@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Ken Chen <chen.kenyy@inventec.com>,
 Andrew Peng <pengms1@lenovo.com>, Adriana Kobylak <anoo@us.ibm.com>,
 Brian Yang <yang.brianc.w@inventec.com>, Lotus Xu <xuxiaohan@bytedance.com>,
 Alexander Filippov <a.filippov@yadro.com>, Ben Pai <Ben_Pai@wistron.com>,
 Yuan Yao <yao.yuan@linaro.org>, Hongwei Zhang <hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 26, 2021 at 02:42:20PM +0930, Joel Stanley wrote:
> 
> Most of the aspeed boards have copied the 'earlyprink' string in
> the bootargs. However, there's no earlyprink driver configured in the
> defconfigs, so this does nothing.
> 
> A combination of setting stdout in the chosen node and adding earlycon
> to bootargs causes early serial output to appear early. This changes all
> boards to use this option.
> 
> The console=ttyS4,115200 option is still required, as this is used by
> the run time uart driver.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Alexander Filippov <a.filippov@yadro>

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts                 | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts            | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts           | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts     | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts        | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts         | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts            | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts      | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts         | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts         | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts           | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts            | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts         | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts       | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts             | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts              | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts              | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts              | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts            | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts             | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts               | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts              | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts              | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts         | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts               | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts        | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts             | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts       | 2 +-
>  29 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 8bec21ed0de5..583a241f1151 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -13,7 +13,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 6aeb47c44eba..79d17841b3d7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -34,7 +34,7 @@ aliases {
>  	};
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  	leds {
>  		compatible = "gpio-leds";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 8f5ec22e51c2..bbf8d548397b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -9,7 +9,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> index c2ece0b91885..3395de96ee11 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> index 2c29ac037d32..7c6af7f226e7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> index dcab6e78dfa4..33e413ca07e4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -15,7 +15,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> index 5ef88c377358..01dace8f5e5f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -55,7 +55,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index 2fb8b147f489..90a3f485c67a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -280,7 +280,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart1;
> -		bootargs = "console=ttyS1,9600n8 root=/dev/ram rw earlyprintk";
> +		bootargs = "console=ttyS1,9600n8 root=/dev/ram rw earlycon";
>  	};
>  
>  	ast-adc-hwmon {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index 7b4b2b126ad8..b6b16356f571 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -37,7 +37,7 @@ aliases {
>  	};
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index 07593897fc9a..1752f3250e44 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> index 80c92e065a10..5a98a19f445e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> @@ -11,7 +11,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "earlyprintk";
> +		bootargs = "earlycon";
>  	};
>  
>  	memory {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> index 6e9baf3bba53..d5b7d28cda88 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "earlyprintk";
> +		bootargs = "earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> index c29e5f4d86ad..8f543cca7c21 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> @@ -27,7 +27,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> index 084c455ad4cb..bcc1820f5c07 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> @@ -27,7 +27,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> index 73319917cb74..3ef8358ff764 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> @@ -11,7 +11,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@40000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> index 42b37a204241..c0847636f20b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> @@ -11,7 +11,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> index 15c1f0ac81dc..a52a289cee85 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -57,7 +57,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> index 8503152faaf0..7d38d121ec6d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> @@ -11,7 +11,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts b/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
> index 91dced7e7849..3d4bdad27c2d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index eb4e93a57ff4..cd660c1ff3f5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@40000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index fd2e014dae75..084f54866f38 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -9,7 +9,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index d56b5ed09b37..4816486c0c9e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index c1478d2db602..e863ec088970 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -13,7 +13,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200n8";
> +		bootargs = "console=ttyS4,115200n8 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> index 01074b6e3e03..328ef472c479 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
> @@ -11,7 +11,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@40000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 85d58a63ae90..230f3584bcab 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -10,7 +10,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 4bcc82046362..7ae4ea0d2931 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -17,7 +17,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> index 03c161493ffc..61bc74b423cf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -14,7 +14,7 @@ aliases {
>  	};
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@80000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index a68ff0675c28..9605e53f5bbf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -28,7 +28,7 @@ aliases {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=ttyS4,115200 earlycon";
>  	};
>  
>  	memory@40000000 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
> index bc16ad2b5c80..50f3c6a5c0c8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
> @@ -11,7 +11,7 @@ / {
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "earlyprintk";
> +		bootargs = "earlycon";
>  	};
>  
>  	memory@80000000 {
> -- 
> 2.30.2
> 
