Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E163C34E
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Nov 2022 16:06:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM5Jj296sz3bSw
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Nov 2022 02:06:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AoZfmFeY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AoZfmFeY;
	dkim-atps=neutral
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM5JT5XZ5z30RG
	for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Nov 2022 02:06:15 +1100 (AEDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-14279410bf4so17332605fac.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Nov 2022 07:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kDwNcelrs2eUV+lrqFjarpCKpHkKCs1VhcZri8buYKI=;
        b=AoZfmFeYKOl4l2lIHPCkTbcdpAwJpSta0pfkYwaOkFHCISQw8IoGt3aERVL2/nqOkC
         a6BHyldoXF8TPzDrKg0hHQ+iLMySV9kk5duA9ppJwI3nVnZkecI7mqXVjTzxjc1tPf1s
         Hlx15iEgHrOjRYo0NFhhTx1q/VYw5qA3kSnG/L/75Bylsq7133s9dlcs8Qr30wwEV7OG
         fNFek9RS1KKxHLxzZ/tujDKRHxDGuDqt7+cMME8GxWqaraogMMeyD/FP/SgXOdZq/OZw
         5MI31UGRbttIb/R9Kk+rkdl4d+hqpbnXIkdE9XBkr6wnotATQzBzfuZTkWlopIn4Ubmp
         l5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDwNcelrs2eUV+lrqFjarpCKpHkKCs1VhcZri8buYKI=;
        b=Sc8Y7dI+hO2AWigBzjm6PwmYtZLPjKcyQ4loa0cySVVKXuWppf+OHr0VxXgU+xR5ph
         ICG8l0mk/ahhinnjAaIgcwHRoFhactopmNl0FhOOykTpsGnushYWiS3SCAfvihq5rhyP
         Rvb82+XE9MrzBhM2VQR/YxzOAGlgM2D10LyzMMm4jSdyPNLaMiCXqdH0xjkMPiY7Bwqu
         4j0jWTWFNs+8WrzqWRM6mtXOPNowrhZHruGQ37U+VpEDnSCrWwwtBDg7jMNGnHySJ/4F
         ICbPGTwegRHHVf7PV5DXWY4Lbyzj+lxg1G8vCwsVAVV/n5EodVToFZHe3nIgKsSc5deH
         6nXA==
X-Gm-Message-State: ANoB5pnf6kaHaIdvAUQAppJ0GRwhWA76L4fOdSGLBWGZMB1c5bGvvyNX
	cep0/bU5ZOg+5mrqmcjwenk=
X-Google-Smtp-Source: AA0mqf5oDydb9EGtYPiKSPOiYCPpv8fl65qEocklfg33+p3F9hythil2GZwIwm+FvmCbwsKu6AnaMQ==
X-Received: by 2002:a05:6870:54d2:b0:131:e200:1492 with SMTP id g18-20020a05687054d200b00131e2001492mr21190025oan.44.1669734367149;
        Tue, 29 Nov 2022 07:06:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9-20020a4ad009000000b0049be9c3c15dsm5517327oor.33.2022.11.29.07.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 07:06:06 -0800 (PST)
Message-ID: <a0b48e60-59ce-0033-b09f-2f92983753b7@roeck-us.net>
Date: Tue, 29 Nov 2022 07:06:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [v4 5/5] hwmon: Add Aspeed ast2600 TACH support
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "lee@kernel.org" <lee@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-6-billy_tsai@aspeedtech.com>
 <bf851fa1-af62-5cdc-8cb4-bcf29b73731a@roeck-us.net>
 <D5F454FE-9C4B-4B7E-8817-637D5FCC047A@aspeedtech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <D5F454FE-9C4B-4B7E-8817-637D5FCC047A@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/28/22 23:08, Billy Tsai wrote:
> On 2022/11/23, 11:45 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>      On 11/22/22 22:16, Billy Tsai wrote:
>      > > +The driver provides the following sensor accesses in sysfs:
>      > > +=============== ======= =====================================================
>      > > +fanX_input	ro	provide current fan rotation value in RPM as reported
>      > > +			by the fan to the device.
>      > > +fanX_div	rw	Fan divisor: Supported value are power of 4 (1, 4, 16
>      > > +                        64, ... 4194304)
> 
>      > The code doesn't support 1.
> 
> The code can support 1.
> 
Sorry, leftover from when I misread the code and thought it didn't.
> 
>      > The existence of a status register makes me wonder what is in there.
>      > Does the controller report any errors ? If so, it might be worthwile
>      > adding attribute(s) for it.
> 
>      > > +	if (ret)
>      > > +		return ret;
>      > > +
>      > > +	if (!(val & TACH_ASPEED_FULL_MEASUREMENT))
>      > > +		return 0;
>      > > +	rpm = aspeed_tach_val_to_rpm(priv, fan_tach_ch,
>      > > +				     val & TACH_ASPEED_VALUE_MASK);
>      > > +
>      > > +	return rpm;
> 
> The status register is the TACH_ASPEED_FULL_MEASUREMENT which is used to indicate that
> the controller doesn't detect the change in tach pin for a long time.
> 
>      > > +static void aspeed_create_fan_tach_channel(struct aspeed_tach_data *priv,
>      > > +					   u32 tach_ch)
>      > > +{
>      > > +	priv->tach_present[tach_ch] = true;
>      > > +	priv->tach_channel[tach_ch].limited_inverse = 0;
>      > > +	regmap_write_bits(priv->regmap, TACH_ASPEED_CTRL(tach_ch),
>      > > +			  TACH_ASPEED_INVERS_LIMIT,
>      > > +			  priv->tach_channel[tach_ch].limited_inverse ?
>      > > +				  TACH_ASPEED_INVERS_LIMIT :
>      > > +				  0);
>      > > +
>      > What is the purpose of the above code ? limited_inverse is always 0.
> 
>      > > +	priv->tach_channel[tach_ch].tach_debounce = DEBOUNCE_3_CLK;
>      > > +	regmap_write_bits(priv->regmap, TACH_ASPEED_CTRL(tach_ch),
>      > > +			  TACH_ASPEED_DEBOUNCE_MASK,
>      > > +			  priv->tach_channel[tach_ch].tach_debounce
>      > > +				  << TACH_ASPEED_DEBOUNCE_BIT);
>      > > +
>      > > +	priv->tach_channel[tach_ch].tach_edge = F2F_EDGES;
>      > > +	regmap_write_bits(priv->regmap, TACH_ASPEED_CTRL(tach_ch),
>      > > +			  TACH_ASPEED_IO_EDGE_MASK,
>      > > +			  priv->tach_channel[tach_ch].tach_edge
>      > > +				  << TACH_ASPEED_IO_EDGE_BIT);
>      > > +
> 
>      > limited_inverse, tach_debounce, and tach_edge are constants.
>      > There is no need to keep constants as per-channel variables.
> 
>      > > +	priv->tach_channel[tach_ch].divisor = DEFAULT_TACH_DIV;
>      > > +	regmap_write_bits(priv->regmap, TACH_ASPEED_CTRL(tach_ch),
>      > > +			  TACH_ASPEED_CLK_DIV_T_MASK,
>      > > +			  DIV_TO_REG(priv->tach_channel[tach_ch].divisor)
>      > > +				  << TACH_ASPEED_CLK_DIV_BIT);
>      > > +
>      > > +	priv->tach_channel[tach_ch].threshold = 0;
>      > > +	regmap_write_bits(priv->regmap, TACH_ASPEED_CTRL(tach_ch),
>      > > +			  TACH_ASPEED_THRESHOLD_MASK,
>      > > +			  priv->tach_channel[tach_ch].threshold);
>      > > +
> 
>      > The above applies to threshold as well.
> 
> The above code is used to retain the adjustable feature of the controller.
> I will remove them until I add the dts property to support them.
> 
>      > > +	}
>      > > +
>      > > +	hwmon = devm_hwmon_device_register_with_info(dev, "aspeed_tach", priv,
>      > > +						     &aspeed_tach_chip_info, NULL);
>      > > +	ret = PTR_ERR_OR_ZERO(hwmon);
>      > > +	if (ret)
>      > > +		return dev_err_probe(dev, ret,
>      > > +				     "Failed to register hwmon device\n");
>      > > +	return 0;
> 
>      > Why not return the error ? Either it is an error or it isn't. If it is
>      > not an error, dev_err_probe() is not appropriate. If it is, the error
>      > should be returned. Either case, if this is on purpose, it needs an
>      > explanation.
> 
> I have return the return value of the dev_err_probe. Did I miss someting?
> 
No, me not having enough coffee when reviewing the code. Sorry for the noise.

Thanks,
Guenter

