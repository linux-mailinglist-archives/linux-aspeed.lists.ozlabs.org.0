Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A727EC35D
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Nov 2023 14:12:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BVDnF5e4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVk982cH2z3cVs
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Nov 2023 00:12:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BVDnF5e4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVk8z4MZhz2yRS
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Nov 2023 00:12:18 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-778940531dbso411959885a.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Nov 2023 05:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700053935; x=1700658735; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYJiido5hWzDKtuGReYk+NTentFWgMjd8DEBxS+St7Y=;
        b=BVDnF5e4TTN0RYsQXS8DqFGGKEp+xmiJMRrEU/3rWV8iZNK9oTP+dLlJJot/e8C1GY
         DdsZgJmYyyUwLk7mslmOHDTkttBb8V3HrE9yb5kVLRVKBUS2ym3VjQUAVKbpfMk2k6Nq
         YuSBKcQFIJ2xCV7MW1C4QWdD5Y7xY3iKBkaawGpcQamRwabD5akSWxQWoiJUqcPNAa9C
         lOj5dhAkbC96tQWekId7zpJpkceTOckVWh++fPIl5hCSoJgfk53UiywWWxdN87t0XC08
         E9iKsIcpEmqR0uqVHeZkOXVOO1mKaqOxtZOWOT7BIMBtF+cQ1kfZNzmZipKUJSJ6vuYh
         i71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053935; x=1700658735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJiido5hWzDKtuGReYk+NTentFWgMjd8DEBxS+St7Y=;
        b=Y2mMB40yEMTcAE8l0RF9xsmAV8M+HjpjHDe6Bt2Aoid7r8KR0YnnAdYyfFyOj3VJBM
         akak37hFuRGIZtDvnqhpQQyzr1L5/NOa8ECwp066sYqHLDZxdwWxLdmyiEpT+1b1Ek7N
         H3g1wey1o36WZn/+hY0ocVUZ8gf9eMesY8uOsOYRuvPMtRakC0j61Ge8OahrGJ6vdPpN
         AXRdUfMmc27qq2kca6qxxHZt2ZLeleGqxA1e/Pjh1Z3u/S3ySN4qu/ROhyYDeG8EV//q
         0tuUiF6n0lBBkCMeW95mIUGZJaguZyFUgTl8hYeaY8ejqofik8zjSjq8x223wgI/HVes
         EZYQ==
X-Gm-Message-State: AOJu0YxAiz7OZWKGqoJcP6I7PAOtmmNMo9RDg3WbPfTxxc3yKf2EGNZx
	+TpNme0Iw8WQ7AH76tEc/is=
X-Google-Smtp-Source: AGHT+IGhIxWgPMm8wqUw4hMJ5kHDs/Trl+Fudc3+UErv6dl9+e9FP4PNtTnJqgtywEwuz9/B7UU77w==
X-Received: by 2002:a05:620a:4552:b0:773:bf62:b274 with SMTP id u18-20020a05620a455200b00773bf62b274mr6163539qkp.61.1700053934734;
        Wed, 15 Nov 2023 05:12:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m11-20020a05620a290b00b007743382121esm3445056qkp.84.2023.11.15.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:12:14 -0800 (PST)
Date: Wed, 15 Nov 2023 05:12:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2][next] hwmon: (aspeed-pwm-tacho) Fix
 -Wstringop-overflow warning in aspeed_create_fan_tach_channel()
Message-ID: <9ed5116f-cf36-49f6-833e-75eeab4570b4@roeck-us.net>
References: <ZVPQJIP26dIzRAr6@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
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

Still messes the point. This isn't about "the compiler doesn't know that",
it is a real bug which may result in out-of-bounds accesses.

Oh, never mind, I'll just apply it.

Guenter
