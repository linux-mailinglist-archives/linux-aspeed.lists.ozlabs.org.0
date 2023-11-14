Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C67EB2D6
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Nov 2023 15:53:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ScraUUqW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV8Rd6tZ7z3cVF
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Nov 2023 01:53:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ScraUUqW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV8RP02lpz2xdq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Nov 2023 01:52:48 +1100 (AEDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7bae8dd095cso2143237241.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Nov 2023 06:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699973562; x=1700578362; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIQbkwE4qYiMmkgrrvrC/vRWElOWAUQTAZF8XUTl38o=;
        b=ScraUUqWqhtQe3hA2ZUnS5jJxy77RdWyXmQMzdJ8i9vqXgrxHGubtbhYXwMciU0xs6
         0YYceYLSYkNLknsmu+5jXGb1hKPjxY7Me+/wE2+1bvLvKxtdG9q7mibssomTlJ2pUX/q
         VelfO7q0/tWGzOjC+k+FWKfN9hTDTdNmiKuIBoMG/w0ekeKmKYkorirWoS2ugtQRXTgh
         stHK0KFQAS2ow4oy9i3HCUHZOCm+1b3Rxdg7XQ5oID7+5WyRZkaILJSNnMzfNqbPpZVF
         Pwbv/nIYJ4LiGMChAhE+9vrWNpV0uxIpbFHhvqnrIw0oTbrYzKk8lIXVOqtpU2RKBlgO
         5q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699973562; x=1700578362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIQbkwE4qYiMmkgrrvrC/vRWElOWAUQTAZF8XUTl38o=;
        b=ZCA29vnUMNaG7zNQKaFwtX6WCIFT/PzOXemLemPJCDf391/JbziLGeLB1jzUiMv7D8
         1qjaawFNccZcTxNQK3t4mwK3qXhPTObO9BLuDsKKJnzOgzfA5iasXKivE+N2Xhih3EJw
         e33f97KL4M0mYb1x/j/XEYpQbWmB4y5jXPH+L3McLDJph9SUNvpuDLs6Y48HGl6iph0n
         cEv7VFu4T5DSSnPIr8Q6ANkj8/H1fQoyAbUPtPxPpGqQpqlgJyiTK6QKiDiQlQG/u8sl
         ooG4s8Hi88Wkq88KXrgs3jITzNFzPjFjei11lW+JIorOi+l+sS8qr3OZlenhWdbIL3yy
         X0RQ==
X-Gm-Message-State: AOJu0YziRf4ZZ6wz4W9ufdQz+G+0u37wbi2q7tA6gG16km0C5ulnLkWO
	ey+P0pGCSAr6TkOwoVsT0K0=
X-Google-Smtp-Source: AGHT+IHAT5eAXs0OaMM9X2ywWIX9bE+jyDw4UB13bEFULtdfpf3ZE2T5zvAD66+57RF8WEXQFMTqwQ==
X-Received: by 2002:a67:cc16:0:b0:45f:8b65:28e2 with SMTP id q22-20020a67cc16000000b0045f8b6528e2mr8060279vsl.32.1699973562333;
        Tue, 14 Nov 2023 06:52:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c4-20020a05621401c400b006754772bfd4sm2944138qvt.21.2023.11.14.06.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:52:41 -0800 (PST)
Date: Tue, 14 Nov 2023 06:52:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] hwmon: (aspeed-pwm-tacho) Fix -Wstringop-overflow
 warning in aspeed_create_fan_tach_channel()
Message-ID: <6a28c219-b047-411b-ab43-02fc8f1824db@roeck-us.net>
References: <ZVJ7JBFoULzY3VGx@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVJ7JBFoULzY3VGx@work>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Nov 13, 2023 at 01:38:12PM -0600, Gustavo A. R. Silva wrote:
> Based on the documentation below, the maximum number of Fan tach
> channels is 16:
> 
> Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt:45:
>  45 - aspeed,fan-tach-ch : should specify the Fan tach input channel.
>  46                 integer value in the range 0 through 15, with 0 indicating
>  47                 Fan tach channel 0 and 15 indicating Fan tach channel 15.
>  48                 At least one Fan tach input channel is required.
> 
> However, the compiler doesn't know that, and legitimaly warns about a potential
> overwrite in array `u8 fan_tach_ch_source[16]` in `struct aspeed_pwm_tacho_data`,
> in case `index` takes a value outside the boundaries of the array:
> 

All that doesn't warrant introducing checkpatch warnings.

> drivers/hwmon/aspeed-pwm-tacho.c:
> 179 struct aspeed_pwm_tacho_data {
> ...
> 184         bool fan_tach_present[16];
> ...
> 193         u8 fan_tach_ch_source[16];
> ...
> 196 };
> 
> In function ‘aspeed_create_fan_tach_channel’,
>     inlined from ‘aspeed_create_fan’ at drivers/hwmon/aspeed-pwm-tacho.c:877:2,
>     inlined from ‘aspeed_pwm_tacho_probe’ at drivers/hwmon/aspeed-pwm-tacho.c:936:9:
> drivers/hwmon/aspeed-pwm-tacho.c:751:49: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
>   751 |                 priv->fan_tach_ch_source[index] = pwm_source;
>       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> drivers/hwmon/aspeed-pwm-tacho.c: In function ‘aspeed_pwm_tacho_probe’:
> drivers/hwmon/aspeed-pwm-tacho.c:193:12: note: at offset [48, 255] into destination object ‘fan_tach_ch_source’ of size 16
>   193 |         u8 fan_tach_ch_source[16];
>       |            ^~~~~~~~~~~~~~~~~~
> 
> Fix this by sanity checking `index` before using it to index arrays of
> size 16 elements in `struct aspeed_pwm_tacho_data`. Also, and just for
> completeness, add a `pr_err()` message to display in the unlikely case
> `0 > index >= 16`.
> 
> This is probably the last remaining -Wstringop-overflow issue in the
> kernel, and this patch helps with the ongoing efforts to enable such
> compiler option globally.
> 

I am sorry, but this description almost completely misses the point.
The real issue is that the values in aspeed,fan-tach-ch are not range
checked, which can cause real problems if is elements are set to values
larger than 15. This is a real problem and has nothing to do with string
overflows.

> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 997df4b40509..092a81916325 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -166,6 +166,8 @@
>  
>  #define MAX_CDEV_NAME_LEN 16
>  
> +#define MAX_ASPEED_FAN_TACH_CHANNELS 16
> +
>  struct aspeed_cooling_device {
>  	char name[16];
>  	struct aspeed_pwm_tacho_data *priv;
> @@ -181,7 +183,7 @@ struct aspeed_pwm_tacho_data {
>  	struct reset_control *rst;
>  	unsigned long clk_freq;
>  	bool pwm_present[8];
> -	bool fan_tach_present[16];
> +	bool fan_tach_present[MAX_ASPEED_FAN_TACH_CHANNELS];
>  	u8 type_pwm_clock_unit[3];
>  	u8 type_pwm_clock_division_h[3];
>  	u8 type_pwm_clock_division_l[3];
> @@ -190,7 +192,7 @@ struct aspeed_pwm_tacho_data {
>  	u16 type_fan_tach_unit[3];
>  	u8 pwm_port_type[8];
>  	u8 pwm_port_fan_ctrl[8];
> -	u8 fan_tach_ch_source[16];
> +	u8 fan_tach_ch_source[MAX_ASPEED_FAN_TACH_CHANNELS];
>  	struct aspeed_cooling_device *cdev[8];
>  	const struct attribute_group *groups[3];
>  };
> @@ -746,10 +748,14 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
>  
>  	for (val = 0; val < count; val++) {
>  		index = fan_tach_ch[val];
> -		aspeed_set_fan_tach_ch_enable(priv->regmap, index, true);
> -		priv->fan_tach_present[index] = true;
> -		priv->fan_tach_ch_source[index] = pwm_source;
> -		aspeed_set_fan_tach_ch_source(priv->regmap, index, pwm_source);
> +		if (index < MAX_ASPEED_FAN_TACH_CHANNELS) {
> +			aspeed_set_fan_tach_ch_enable(priv->regmap, index, true);
> +			priv->fan_tach_present[index] = true;
> +			priv->fan_tach_ch_source[index] = pwm_source;
> +			aspeed_set_fan_tach_ch_source(priv->regmap, index, pwm_source);
> +		} else {
> +			pr_err("Invalid Fan Tach input channel %u\n.", index);

This should use dev_err() (and, yes, that means dev needs to be passed
as argument), and the function should return -EINVAL if this is
encountered. Also, error handling should come first.

		if (index >= MAX_ASPEED_FAN_TACH_CHANNELS) {
			dev_err(dev, "Invalid Fan Tach input channel %u\n.", index);
			return -EINVAL;
		}

Thanks,
Guenter
