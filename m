Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005184870B
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Feb 2024 16:15:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DmxLkjCQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRx5m2QKyz3cKV
	for <lists+linux-aspeed@lfdr.de>; Sun,  4 Feb 2024 02:15:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DmxLkjCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRx5g5xhgz3bs2
	for <linux-aspeed@lists.ozlabs.org>; Sun,  4 Feb 2024 02:15:03 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bbb4806f67so2300557b6e.3
        for <linux-aspeed@lists.ozlabs.org>; Sat, 03 Feb 2024 07:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706973300; x=1707578100; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFuXP3UV1xnywaTqFOinvyF6IAzq5e2/c/XsGf493CE=;
        b=DmxLkjCQwjSHlfInW9S9gDZQhG/u2o+51ZQO6mXEOAIwoIY+fO5YK2NWyeNCKkGfJR
         3dP/vxAGIQXVX6UQyxbm6shkmTwp256G5LjBNihLQBBDwRPUfVpDoXShFJHGmEgR6I4m
         imn73MITcMU8BY7StrEtHXSwgz4gLWmtoQWAW0CeP+Y2it6GODrk4ZeKJKDYoa2yq57g
         PEw0UDZ2GHiKxTR8gMM2S9kSc+JlDHNjP1QKwjVDy5m/SblKf01TVQqA+WWquKsyQhCf
         68Qwh99Gqv0UX2ZhxHHDvABlTZyr8YeHRsnMjOV5/wURorEshKCzTuYrZEJf8EV9Ko5u
         iYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706973300; x=1707578100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFuXP3UV1xnywaTqFOinvyF6IAzq5e2/c/XsGf493CE=;
        b=F8sUMmkIpyxRnfFQmBtSmYWtQr50heETZhsdAssxHoevSyiCD6YvVeT8YtK0xDL/zX
         D3DcgVOy0xCmy4Q/aaeHsnp69ws2d0OZ/ZLTgeUVuvW8Kh/YjBFPPGxRG1v4DBWZkhV7
         K9mJqk47yJnFEfBVCaj+B8ggOHFseYs/HlwA8SF5ToMb3g08uBJ43brHJI9h49PSMb90
         N9YlJVt2XaoYVNdxG2g5C64psTDupeSoqW8tJyyY9K5POAlk8PPVkkdyFtfaqFfMgRaa
         0AaFkj2qWHfWIIc+123CreNp6+rr7oRi+ZuivKYY4myZE70HO9Dcu+r8oxDjqvAXd5DW
         y2TQ==
X-Gm-Message-State: AOJu0Yz5vk/457mpdMEZuMY4evhuOhAGMP4L1SWW0FsdR1tfbS/iliwh
	hUzxVuWB6f08dABtf3ZgF5lDUL2JXdUslqrbvp1e6StNp05iquY3
X-Google-Smtp-Source: AGHT+IF40Z0pjbJVzRvxEw7OzgOmlZu9RvZZEAgaSfdBvk8bmmqKo0Aew1Kh+sLESnM1+9BvKO/F3g==
X-Received: by 2002:a05:6358:3a0a:b0:178:99cc:e52e with SMTP id g10-20020a0563583a0a00b0017899cce52emr11976858rwe.20.1706973300201;
        Sat, 03 Feb 2024 07:15:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXTS+Z3mcZ6h5OmaPznlOk7RjwoMElBSaLMG1YBYjQQ6o4PoiF+thK+DxD6vnP0WDdwlJcYAacZ070/13N631A0eQ13jBD3PxkyosoPkmu1XM8Q6IxFJXbbBwWEgmlQqoKVsOinluo6CwyRfvX0cjnAdzdzJrEGArzZVF9UWlrXf8/Ny2jMytCD4ORWzgFw1PtTati5JUiT3q+HCu0raH2R5Bu0CD4ctRKqPRl846UVu/0ji9It8ABe6m1Dmy1pu2x9BJTORKcrgrA3LOVGSY705xu9UchNnkG4By/PJuFFfogeb4k=
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bs10-20020a63280a000000b005bd2b3a03eesm3658342pgb.6.2024.02.03.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 07:14:59 -0800 (PST)
Date: Sat, 3 Feb 2024 07:14:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Hansen <alexander.hansen@9elements.com>
Subject: Re: [PATCH v1 1/1] hwmon: (aspeed-pwm-tacho) mutex for tach reading
Message-ID: <a70d020a-6289-4087-81eb-a4d6ea339b92@roeck-us.net>
References: <121d888762a1232ef403cf35230ccf7b3887083a.1699007401.git.alexander.hansen@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <121d888762a1232ef403cf35230ccf7b3887083a.1699007401.git.alexander.hansen@9elements.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Loic Prylli <lprylli@netflix.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Nov 03, 2023 at 11:30:55AM +0100, Alexander Hansen wrote:
> From: Loic Prylli <lprylli@netflix.com>
> 
> the ASPEED_PTCR_RESULT Register can only hold the result for a
> single fan input. Adding a mutex to protect the register until the
> reading is done.
> 
> Signed-off-by: Loic Prylli <lprylli@netflix.com>
> Signed-off-by: Alexander Hansen <alexander.hansen@9elements.com>

Somehow this patch got lost. Sorry for that. Applied.

Guenter
