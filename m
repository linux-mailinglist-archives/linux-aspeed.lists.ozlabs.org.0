Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7378F7B9
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Sep 2023 06:57:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KwbBmhGx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcQk563fjz3byH
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Sep 2023 14:57:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KwbBmhGx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcQjy0pTWz2yVL
	for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Sep 2023 14:56:52 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bc63ef9959so12404295ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Aug 2023 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693544207; x=1694149007; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxMAdQ9JHhbY/6XOYXhohZX4W0hkhsENsmdXA3joCPY=;
        b=KwbBmhGxm6oPqj7Sp/S/jl1RRomJAQrUUdlV5a7v81M6Ht1JeP9kcY6iFuygGKCH//
         JyRWBninvkLVcVdUvgLepY4NpjbbuugV687o3vi7twxvQQnM+KVZRU+lzHrE5xk3K1Z3
         7PQcyIIR0hILFVpJUEl0NTbwsspl6fzWycAvlRXY3phmMK87o65Tw78AZE1VNKC7fUkj
         WkUFVV0WiPUzrEGz9aGSQSKx5ip7RAk6t7NQK1jhAvI1/dEHg4nDcyIeub6Qif7nG43J
         jGO77hmu23hW6elqhyVjvSdmUpAk+PMxcDkhtVsfUSdkZkgQsglE1i1c8wHKhwyasznk
         c3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693544207; x=1694149007;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxMAdQ9JHhbY/6XOYXhohZX4W0hkhsENsmdXA3joCPY=;
        b=N9Rm7ZNdceBBg4YQfGT2ZutkZtSRRpyMxuHC2I5nnJQ1+r30bjq7ry6fYAKa/xVrSi
         uJE408nbPhaZ0OIEVVCc96gzdtf077E4BU1zy+8t7Ijp1mPdaGvTSRCEcaFnoF97vdVS
         uNmxkIqTVBdNX4E8wWoMumCvZ2LQjWCDLtBXAW9rUKiVL0udG+q2T6isqRDggZLYdJ1Q
         QeLdktj0AkJw7CL7nGISawwCmBaWMIxIDV3jDscKvKytIpdI5HlZZJWe/H5cLE03nMpB
         A04t0YL1xgaY8yWuVqtF745dhzO+GnGoxeYEpgj/mBQzny7LgiRPWbFmmp/Crqrjmyid
         O52A==
X-Gm-Message-State: AOJu0Yy9RoSJadrgOaNjQQHVkMXYgVE+JyC/97knwNZ6fGYLons+NTe/
	7jkf46DIS54hvtDbDraci5k=
X-Google-Smtp-Source: AGHT+IF6QDy3CuYUe+uak82ob23I21g9dB49A8IeXHA8TbCz/H5rYUS4VaHBNmXQXV04PA1Rwb8IDw==
X-Received: by 2002:a17:902:c40b:b0:1b9:de75:d5bb with SMTP id k11-20020a170902c40b00b001b9de75d5bbmr2191573plk.7.1693544207479;
        Thu, 31 Aug 2023 21:56:47 -0700 (PDT)
Received: from [10.10.4.41] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001adf6b21c77sm2036354pld.107.2023.08.31.21.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 21:56:46 -0700 (PDT)
Message-ID: <99ffd1fb-14ae-1c83-bc32-2d0aead4d696@gmail.com>
Date: Fri, 1 Sep 2023 12:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED
 g6 PWM/Fan tach
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>
References: <20230830123202.3408318-1-billy_tsai@aspeedtech.com>
 <20230830123202.3408318-4-billy_tsai@aspeedtech.com>
From: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <20230830123202.3408318-4-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, BMC-SW@aspeedtech.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 8/30/23 20:32, Billy Tsai wrote:
> +static int aspeed_tach_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, long val)
> +{
> +	struct aspeed_pwm_tach_data *priv = dev_get_drvdata(dev);
> +	u32 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_fan_div:
> +		if (!is_power_of_2(val) || (ilog2(val) % 2) ||
> +		    DIV_TO_REG(val) > 0xb)
> +			return -EINVAL;
> +		priv->tach_divisor = val;
> +		reg_val = readl(priv->base + TACH_ASPEED_CTRL(channel));
> +		reg_val &= ~TACH_ASPEED_CLK_DIV_T_MASK;
> +		reg_val |= FIELD_GET(TACH_ASPEED_CLK_DIV_T_MASK,
> +				     DIV_TO_REG(priv->tach_divisor));
Hi Billy,
I notice the fanX_div is always shows 1 after I set 1024.
I think FIELD_GET() needs to replaced with FIELD_PREP().

> +		writel(reg_val, priv->base + TACH_ASPEED_CTRL(channel));
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}


> +static void aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u32 tach_ch)
> +{
> +	u32 val;
> +
> +	priv->tach_present[tach_ch] = true;
> +	priv->tach_divisor = DEFAULT_TACH_DIV;
> +
> +	val = readl(priv->base + TACH_ASPEED_CTRL(tach_ch));
> +	val &= ~(TACH_ASPEED_INVERS_LIMIT | TACH_ASPEED_DEBOUNCE_MASK |
> +		 TACH_ASPEED_IO_EDGE_MASK | TACH_ASPEED_CLK_DIV_T_MASK |
> +		 TACH_ASPEED_THRESHOLD_MASK);
> +	val |= (DEBOUNCE_3_CLK << TACH_ASPEED_DEBOUNCE_BIT) | F2F_EDGES |
> +	       FIELD_GET(TACH_ASPEED_CLK_DIV_T_MASK,
> +			 DIV_TO_REG(priv->tach_divisor));
And here as well.

> +	writel(val, priv->base + TACH_ASPEED_CTRL(tach_ch));
> +
> +	aspeed_tach_ch_enable(priv, tach_ch, true);
> +}
> +
>

