Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01335F132
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 12:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKykS11bqz3bT7
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 20:04:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lt8+i8lo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62d;
 helo=mail-ej1-x62d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lt8+i8lo; dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKyjz6Vw4z303H
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 20:04:07 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id w3so30550591ejc.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2OpST8LZI3on8yL2X/9Onf1MCgH2abOvm7orSC5DgBk=;
 b=lt8+i8lovz9jfZGaOrASIPMN/fDFTBck9Fq0nTM7pv1znMsXju14rrSC+rEONzv9ar
 u8P/Ee2s4Az7i0+dfG7w0hGm4uxOQxlg9BBeUdtQ66hdIlFpTie0XO4AFDHqK41jtekf
 PxP3cAUwvl9veQ5sUPSixbmg830+ZVLq2TlR+1K/ceAAc9pFHvIYXLFyyk1xXmwEm6Zm
 itFdzMrXqMv0FpCEDFEwPrcaS3ZlYZqrTliSbNIjY2ewsuRbOQRNjohDB3Wgm47jwWDf
 CKXzTRgoug31mdPXDoaSeNa0hJL56biyPxQz/vvKy43gXYgE5SpOc+1jKG/iszmaaDNr
 CFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2OpST8LZI3on8yL2X/9Onf1MCgH2abOvm7orSC5DgBk=;
 b=VDqpfAUEHUdwK9ljd1U/7d9jWQPcLS72dgj4MkB5LMzSqYVVqaJqrpQjNuc3Z56Rxr
 JYlbTm5LpdAsNAlZBfVvpccZoQm8xeZuTJ8gKmW3VbpwFxO1wJ7BlN9FCl9PUXwSUwnz
 T8sRT66kaSLuhWHEvxIar3JB/7GTAK/ey7fwcYEDifeNl0xZv7/LqeXj47cVeSnxigSF
 Az+kj+E8zODn2Yvj/LHoF62Q4UXO+SPo2rVXLYv40C0JYS7vzipgP1eayXbmMyUdwF91
 /yQlnwGmARgWCyb7iNHj9QBTSWb0JFOTgF1IIL6fyWuiUZgzxLWA0VM+pe10Gs0wgDFV
 nyZw==
X-Gm-Message-State: AOAM530Fr33e3wzHDt9zyyQDCM3f3H2X2GWjeqAK/6hRfQs2CBaOpbXG
 OWw8zuDYbl731Q7MeihvnbbKNA==
X-Google-Smtp-Source: ABdhPJz91W52QEgwyT/N/q7ZpiRgN8LqDMeAi7/HCXCRFRkriz17el2EnLVeJBWrE/CdPAzD1GN89A==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr37360252ejc.292.1618394640619; 
 Wed, 14 Apr 2021 03:04:00 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id d18sm1809230edv.1.2021.04.14.03.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 03:04:00 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:03:58 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro
 support
Message-ID: <20210414100358.GL4869@dell>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329015238.19474-3-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 29 Mar 2021, Quan Nguyen wrote:

> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
> platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/mfd/Kconfig          | 10 ++++++++++
>  drivers/mfd/simple-mfd-i2c.c |  6 ++++++
>  2 files changed, 16 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
