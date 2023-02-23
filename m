Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F936A35C2
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Feb 2023 01:03:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQ10n5mwrz3c9x
	for <lists+linux-aspeed@lfdr.de>; Mon, 27 Feb 2023 11:03:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lx6aIrjB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=ivitro@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lx6aIrjB;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN74F23TQz3cdC
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Feb 2023 09:29:31 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id bt28so5481454wrb.8
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Feb 2023 14:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1x2qdveok5thAdT6xjWjQMzIRmnIfphiCecrUrysglQ=;
        b=lx6aIrjBuQDX51KNLowyjtdJ+i5khKR2uA98SDd5kJ1ELRccrPO8Cv7Dw6TJdwBazZ
         IuuTGyWzIGo80urYyzWxAU7es7+GwXNuRquH2Yo1AyFVr3suz7LhwbnCJIpSThQ0i7oG
         lxY40n+mALa9cmGvsaSR6nSPRB81iiojRVu4+zgnY8M1/+/w6pj9m5rQPzd2hjHQneTG
         YjK3JZacyEJgn3K29aSa8Q7HrC22pL6s5p2Zb2L2y5E5Xi+UpPlqjc/bETHOb//0BBAJ
         dieeAlLGwggIO63UhcXnBs11bnEiiIFTau59DojZnUQ6BmvPBjnUjDERvDztpdhAW5eu
         pxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1x2qdveok5thAdT6xjWjQMzIRmnIfphiCecrUrysglQ=;
        b=0y3GZiHc/uV7iprfTCbg9uzGJZCr0YWIrBpZ8a4+FlAedYxYdT6X0AWD2YLtc1Cvkf
         zGwp/lAwMYTpYgu1Lhs3quFjM97iQaKhMCuhE5Bvn1MqB1pjYoyetoQUAwETgpcC2RBE
         DOW6EM6hB221HOA7Zxp5WN3vb30CagWOwkH+05ZENRSQOwSp6WP8v/FyoERLbRVBOZ74
         JezK5f7GrVyLEWwmsmNEPICMVd17HEaTnZo6tabzt1nMO2t2RokG75GdnoY19hSwfViM
         CwVU8K6V/+4lSWd7eThmr5fYFg+NeqBjO/cAD7s1n1rrWmQ7qp2ipawpdart4J8zNf5C
         /fbQ==
X-Gm-Message-State: AO0yUKV3jqRXXOVY8xzc0H3qzqEZwt9a6dPQ2ZCGDYPV0IOpW8u5I1SF
	WI/u+R1rPpBoGBeKVtTRZZ0=
X-Google-Smtp-Source: AK7set+APxjZeWp4LS4Rb6uitGq05P+QrlDky22A7arjKBjIVjUinc3S3MFLI2v8fARSDogxVjFOeg==
X-Received: by 2002:a5d:40cc:0:b0:2c7:d6e:7e6e with SMTP id b12-20020a5d40cc000000b002c70d6e7e6emr5613702wrq.24.1677191365995;
        Thu, 23 Feb 2023 14:29:25 -0800 (PST)
Received: from [192.168.1.138] (bl21-87-220.dsl.telepac.pt. [2.82.87.220])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d4752000000b002c3f9404c45sm10271427wrs.7.2023.02.23.14.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 14:29:25 -0800 (PST)
Message-ID: <07f8ecaa-9a1a-dcf9-a7f2-fb67f9ddd51a@gmail.com>
Date: Thu, 23 Feb 2023 22:29:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] i3c: dw: Use configured rate and bus mode for clock
 configuration
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
References: <20230216062040.497815-1-jk@codeconstruct.com.au>
From: Vitor Soares <ivitro@gmail.com>
In-Reply-To: <20230216062040.497815-1-jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Feb 2023 11:02:56 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Jeremy,

Please find my comments bellow.


On 2/16/23 06:20, Jeremy Kerr wrote:
> We may have a non-typical i3c rate configured; use this (instead of
> the fixed I3C_BUS_TYP_I3C_SCL_RATE) when calculating timing
> characteristics. We can also expand the SCL high time based on the
> presence/absence of i2c devices.
>
> Also, since we now have bus->mode, use it to determine whether we se up
> the BUS_FREE_TIMING register; rather than re-reading
> DEV_CTRL_I2C_SLAVE_PRESENT from hardware.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 44 ++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 51a8608203de..d73d57362b3b 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -515,7 +515,8 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  	dw_i3c_master_start_xfer_locked(master);
>  }
>  
> -static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
> +static int dw_i3c_clk_cfg(struct dw_i3c_master *master, unsigned long i3c_rate,
> +			  bool pure)
>  {
>  	unsigned long core_rate, core_period;
>  	u32 scl_timing;
> @@ -527,31 +528,45 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  
>  	core_period = DIV_ROUND_UP(1000000000, core_rate);
>  
> -	hcnt = DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) - 1;
> -	if (hcnt < SCL_I3C_TIMING_CNT_MIN)
> -		hcnt = SCL_I3C_TIMING_CNT_MIN;
> +	/* 50% duty cycle */
> +	hcnt = DIV_ROUND_UP(core_rate, i3c_rate * 2);
>  
> -	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
> -	if (lcnt < SCL_I3C_TIMING_CNT_MIN)
> -		lcnt = SCL_I3C_TIMING_CNT_MIN;
> +	/* In shared mode, we limit t_high, so that i3c SCL signalling is
> +	 * rejected by the i2c devices' spike filter */
> +	if (!pure)
> +		hcnt = min_t(u8, hcnt,
> +			     DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period)) - 1;

You are assuming that t_high may be lower than 40ns, right?
by the spec the max speed is 12.9MHz, don't think you need this min_t() here.

> +
> +	hcnt = max_t(u8, hcnt, SCL_I3C_TIMING_CNT_MIN);

I would branch this part into:

if(pure)

    hcnt= ;

else

    hcnt= ;

think this way is more readable.

> +
> +	lcnt = DIV_ROUND_UP(core_rate, i3c_rate) - hcnt;
> +	lcnt = max_t(u8, lcnt, SCL_I3C_TIMING_CNT_MIN);
>  
>  	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
>  
> -	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
> +	if (pure)
>  		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
>  
> -	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
> +	/* open drain mode requires a minimum of OD_MIN_NS */

My comment here would say why we need a higher OD time rather the minimum.


> +	lcnt = max_t(u8, lcnt, DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period));
>  	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
>  	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
>  
> -	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
> +	/* Timings for lower SDRx rates where specified by device MXDS values;
> +	 * we limit these to the global max rate provided, which also prevents
> +	 * weird duty cycles */

I think checkpatch complains with this comment format. I would suggest to use like in the rest of kernel.

Unfortunately, we need to address the cases in which SDRx frequency is higher than bus->scl_rate.i3c.


> +	lcnt = max_t(u8, lcnt,
> +		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt);

The lcnt within max_t() function comes from SCL_I3C_OD_TIMING, correct? Have you checked this value for
bus->scl_rate.i3c = 12.5MHz?


>  	scl_timing = SCL_EXT_LCNT_1(lcnt);
> -	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
> +	lcnt = max_t(u8, lcnt,
> +		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt);
>  	scl_timing |= SCL_EXT_LCNT_2(lcnt);
> -	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
> +	lcnt = max_t(u8, lcnt,
> +		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt);
>  	scl_timing |= SCL_EXT_LCNT_3(lcnt);
> -	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
> +	lcnt = max_t(u8, lcnt,
> +		     DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt);

what about to use a for loop and only do lcnt calculation if

bus->scl_rate.i3c > I3C_BUS_SDRx_SCL_RATE ?


>  	scl_timing |= SCL_EXT_LCNT_4(lcnt);
>  	writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
>  
> @@ -605,7 +620,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  			return ret;
>  		fallthrough;
>  	case I3C_BUS_MODE_PURE:
> -		ret = dw_i3c_clk_cfg(master);
> +		ret = dw_i3c_clk_cfg(master, bus->scl_rate.i3c,
> +				     bus->mode == I3C_BUS_MODE_PURE);
>  		if (ret)
>  			return ret;
>  		break;


Best regards,

Vitor Soares

