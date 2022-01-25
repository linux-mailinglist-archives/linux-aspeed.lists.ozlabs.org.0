Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900B49B6B6
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jan 2022 15:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjqS42tCrz3bSh
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jan 2022 01:46:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HMWk3U3N;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HMWk3U3N; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjqRx0lZ7z30Mf
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jan 2022 01:46:34 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id p203so15034011oih.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jan 2022 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=7Z5bK0+Pm8PkUYWJw79nfAVnr5089YtPM73aqhByRKU=;
 b=HMWk3U3Ns5ptKCExZyPaCNn8o7exF6BOZW5ey1aGWKCE77urECqLQzdacioQoIggXv
 1fmBVm+hEkodpaVj+Glni4eA5hN8DIdsjPW4e+WfTkzI/OIfSFsoXzQPhMQnVMXsuyaw
 9yZrctiNDhZUuib0WDQuxUs+4580gHb3Hgc8MGsJ74rd5BqXsNrIXDN5jEfGFa5dDs/m
 u23th50rE40GyPS2HoEK7hH/U7AUAqV3VEOjDSOwVUclkfJ4VhI3kj7uHrNbor7xRK3S
 QN7hRwUjQbgdp85oDXM5Ag1q0vYBZuLgx/ivXSA1gKoPwNVuyTZ+HBC0GvMZKiKSW7rc
 m8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=7Z5bK0+Pm8PkUYWJw79nfAVnr5089YtPM73aqhByRKU=;
 b=aBSS6C9EpCH5EoyA2rW2yNiMhhqCq4BhCeWanoUp5N+SKMiZeyW98rhZvohC5OjmwH
 C3dTI141D7a4+wEwSzjpGv38TWE1ou+T3YiJVtq4FKZ/8pCtbQ4qTWu4D+kT8C2D0Fsv
 1jUNKULJ2fAr5d1rmM7RhnQnl8uyrQpYRr2UHrgzkSX+VJtajpYibr1zWIs3lJoFcyls
 UWE2kKwmQXalEebjJpqzQoi6frlQkTw9JtZ7FZojruBqWP2pGpLU/AG4uibeNpfyQqaz
 srUdC2fUHivSSm3a7friP5RV4fX2y5XNQlhlRLOGRVH++RRoiI9NLJMzMzR1FVy9rXdC
 z5eg==
X-Gm-Message-State: AOAM5308K4feo3xfFmbRfkC0xk6SeI0AkDgMz8AS+u0ECuqoVB2h9rbE
 otfg4A028Vz6PjZrMHvwn8c=
X-Google-Smtp-Source: ABdhPJyQqewm1+WDe2tCvEPLVuiVcWjlKl/DXT10mxiastthfwWfY7zILNKoHxUWlIE/IWQWQ9uUrg==
X-Received: by 2002:a05:6808:909:: with SMTP id
 w9mr850518oih.101.1643121992069; 
 Tue, 25 Jan 2022 06:46:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 44sm7181915otl.15.2022.01.25.06.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 06:46:31 -0800 (PST)
Message-ID: <4e7ca9d8-c545-160a-5578-cf1438223759@roeck-us.net>
Date: Tue, 25 Jan 2022 06:46:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: krishnar4 <krishnar@ami.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20220125130116.18646-1-krishnar@ami.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH linux dev-5.15] hwmon: (pmbus) modify PSU fan_target
 convert value to false
In-Reply-To: <20220125130116.18646-1-krishnar@ami.com>
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
Cc: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Pravinash Jeyapaul <pravinashj@ami.com>, linux-kernel@vger.kernel.org,
 Vinodhini J <vinodhinij@ami.com>, Deepak Kodihalli <dkodihalli@nvidia.com>,
 Shakeeb Pasha <spasha@nvidia.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/25/22 05:01, krishnar4 wrote:
> Description: PSU can't use sysfs fan_target to control PSU fan duty.
> 

This is neither a proper subject nor a proper description.
"modify PSU fan_target convert value to false" means that the
value reported from the attribute is used directly without
conversion. The subject should reflect this.
"Description:" should not be part of the description, and
the description should describe the reason for the change
(ie explain clearly what is wrong).
"PSU can't use sysfs fan_target to control PSU fan duty"
doesn't explain anything and doesn't match the subject.

> Signed-off-by: krishnar4 <krishnar@ami.com>

"krishnar4" is not an acceptable name. This needs to be a real name.

Guenter

> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 776ee2237be2..a56c2e1c4079 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1889,7 +1889,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
>   
>   	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
>   				  0xff, PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
> -				  false, false, true);
> +				  false, false, false);
>   
>   	if (!sensor)
>   		return -ENOMEM;

