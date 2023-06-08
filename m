Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A965727762
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 08:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcF0B0j53z3dxH
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 16:38:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CUbo1fah;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CUbo1fah;
	dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcF015nc8z3cM3
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 16:38:07 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so320815a12.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 23:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686206281; x=1688798281;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqo0A7BM5THz83RAtHMEkVHjNz7WCnOgKYrgDzsaaU4=;
        b=CUbo1fahuMwU8hQpPyLHBQTQNthgS0+azjXEB5AuMpivBaAN7sKBcqOMHCbudzENfS
         E2sZnGqcbYx2nNJ0yBKlteFKjUuDqif5VYX9YDV94/AGcAdw+KtmKakYxEmVd724gm4D
         cgg6z7n3Hn31+jor2LbZSAW6BjWkrJIirz5GlLUhGi1HX7d8qocpZ6PC2QHc5U8lL5Sm
         Mixy66cV0bGiUy/Q5e5jVgtKz1exAoXZFKX4pvxrlUOrC+w+rqPSUHlRk3q2Y9UaSL6/
         /KuNUsRD5M0DtbjpW3yM9eCYmIcUSlviUeNpmY1YHxxcAc+4XrL/W+Y6dMQhcCAeYlde
         5I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206281; x=1688798281;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqo0A7BM5THz83RAtHMEkVHjNz7WCnOgKYrgDzsaaU4=;
        b=DtMSOOsAdaOZB5HxAAYEIkdpV4LNLxmMSZZnA9lkbC0cRkbWbshaSqVdR//J07KdhU
         /oS30D5Cs75EDgJpJv9AIROJxXtwkNmR8fBVIheSInV70z+qSLyJo6XX2Ql7cNfZrc31
         Q6xhK6iinP1lzADGciz+IBupUzDz2h9KS79ull2QYwUpS0bNmPoee8ztqqvvX/ebfy0K
         vcU/+YhttExMIRStNKlzcmAm7Df0oe9vpsKyXBxOmkyM1rPmQBXQGnS29J8ED3RtFXIV
         NCxOhUGiAvqxH4/a9H+hM8ghnm4anmtwxUDxGbBQRWiLxofBVPHV77nPUGZp4BsPo4M5
         yFrQ==
X-Gm-Message-State: AC+VfDxxJPXt2/n/C8mAN/k6orpj5blB6EtttlwFecq8jv1sanQMp2oA
	SQ+tKg/B2cE3tB6ZtuGc49uhrA==
X-Google-Smtp-Source: ACHHUZ4KhhXuTCYSDPgoRLBB4u32f/WMlazF4shqwwkZ3icYzTu7KI3MJObyFYaJY0xBRdj6ON+xew==
X-Received: by 2002:aa7:cc98:0:b0:50d:88f3:2e30 with SMTP id p24-20020aa7cc98000000b0050d88f32e30mr7084851edt.13.1686206281341;
        Wed, 07 Jun 2023 23:38:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n27-20020a056402515b00b00502689a06b2sm168728edd.91.2023.06.07.23.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:38:00 -0700 (PDT)
Message-ID: <797c61d2-b8f1-e80e-24b9-4c7a7d266080@linaro.org>
Date: Thu, 8 Jun 2023 08:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 0/4] Support pwm/tach driver for aspeed ast26xx
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, corbet@lwn.net, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 08/06/2023 04:18, Billy Tsai wrote:
> Unlike the old design that the register setting of the TACH should based
> on the configure of the PWM. In ast26xx, the dependency between pwm and
> tach controller is eliminated and becomes a separate hardware block. One
> is used to provide pwm output and another is used to monitor the frequency
> of the input. Therefore, this patch serials implements them by writing the
> two driver "pwm-aspeed-ast2600.c" and "tach-aspeed-ast2600.c". The former
> is following the pwm subsystem which can apply the existed driver to
> controller the fan(pwm-fan.c), beeper(pwm-beeper.c) and so on. The latter
> is following the sysfs interface of hwmon to creat the node for fan
> monitor.

You like to ignore my comments... How did you implement them? Go one by
one - answer to v4 emails.

Best regards,
Krzysztof

