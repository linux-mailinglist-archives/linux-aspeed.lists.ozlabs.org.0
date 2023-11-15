Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8807EBB6C
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Nov 2023 04:04:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FO+Bi8Hx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVSg24z86z3cSn
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Nov 2023 14:03:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FO+Bi8Hx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVSfm5qPjz30K6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Nov 2023 14:03:42 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso4839342b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Nov 2023 19:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700017420; x=1700622220; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h2NJqY9YsGejP0tvY4g7KbbK4VWtM2B+ypFWWtUvLTI=;
        b=FO+Bi8HxLJ+L8QaW5Ym7Co+Mmq+m9jVWOJU6lzAxKjiLtVrzZEBU7mqkN/aMeqNa5M
         0tbD6kGHA8QD8QezAxsYNqUWbcs0R6iIIBWthsrkVq/JJJz0LuoJSsM+BOurMSnm6B+d
         08uOCt1jW9KT3vpldA3KOAWnm1NRDRrvMEJig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700017420; x=1700622220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2NJqY9YsGejP0tvY4g7KbbK4VWtM2B+ypFWWtUvLTI=;
        b=VbQzTsPjJrFSv3GuJHd1m/e4EGNozRcKLoiDe3J+YLG8SIYzcY9zW6BJKlgKP4hmqG
         y3jTPbRnFfUwcsUF7E2IXtvfEmtx2k2RomIH4VthKDlxO/Z1uOS9GhR3KMzqwCC4umNz
         IqxgMJPtrbQJJLUa9ZUljbIlQqm/Kv4G530/skaFCrYnRYN7nPlgQ9jBmCsGsUdwuvt0
         5zFOzpW+DiBfBDZ/XOepJaR97Esfa+B44gFMaZa+BqInpopRbkrbUi6CrfzaH1mB7zz8
         dBPDwjNDr1m4OQx78P0UDNcMVfj6JwdJqxLCA8iX8UF6X0xzbr+Mlrkf8U9aSlw0ICxa
         PAHw==
X-Gm-Message-State: AOJu0YzWgbAbMtRy+GzqBNfm3ouWarsqTUaXclzrYheP+N3wfDOwsivJ
	Yh7+Lx0RavI3cl2LLgRtzO2v+Z4+13FnbNTRz7Sl9A==
X-Google-Smtp-Source: AGHT+IH2CmT0U/FV4WE9B/tMn8JLmXuKHQNxah2EdL59VFMPy803dw0H/rvMltvHqKIyGPgpgSRxYg==
X-Received: by 2002:a05:6a00:e0d:b0:68a:54e5:24e6 with SMTP id bq13-20020a056a000e0d00b0068a54e524e6mr12166196pfb.8.1700017419680;
        Tue, 14 Nov 2023 19:03:39 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y22-20020a056a00039600b00692754580f0sm1888588pfs.187.2023.11.14.19.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:03:39 -0800 (PST)
Date: Tue, 14 Nov 2023 19:03:38 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2][next] hwmon: (aspeed-pwm-tacho) Fix
 -Wstringop-overflow warning in aspeed_create_fan_tach_channel()
Message-ID: <202311141902.A5AE1300@keescook>
References: <ZVPQJIP26dIzRAr6@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVPQJIP26dIzRAr6@work>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 14, 2023 at 01:53:08PM -0600, Gustavo A. R. Silva wrote:
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
> drivers/hwmon/aspeed-pwm-tacho.c:
> 179 struct aspeed_pwm_tacho_data {
> ...
> 184         bool fan_tach_present[16];
> ...
> 193         u8 fan_tach_ch_source[16];
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
> size 16 elements in `struct aspeed_pwm_tacho_data`. Also, pass `dev` as
> argument to function `aspeed_create_fan_tach_channel()`, and add an error
> message in case `index` is out-of-bounds, in which case return `-EINVAL`.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks for the v2! This looks good; it's able to pass back the error
now.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
