Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5532995EC23
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 10:37:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WskZY0trxz2yVZ
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 18:37:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724661458;
	cv=none; b=ERCMjdczSCC7p7c1nNXFBUOS4opy+tIDboPfWK0eGSZpD6bH0iRG3MVv7O8WNBeG/Fn/zPOONcUhS00Fgn1lczFgy9Yy8+eozVAJZy0k7hcs7q7BS+NJwdNQ/rq/jpurn0rVA/ZbPlzhvIcrsFPkkYH+cteWgXupIbtF6FDfV3A6e7HG2+NOu90dxZ0NIGg95qG2EzvsDp9AXZChpX5Wby4dwMbixJKDNmZX3/bBtp8CsXWd4yOjIk/9qKF+yENDZBVhjQUKJ/khiFvlWr+vAP1/9PSLa/z02ELui8TChSYTb9XJzvy8wny3zX8AW2gyEVgtIEVG9GCOYhV1NsW/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724661458; c=relaxed/relaxed;
	bh=mGxn7htxuwUZYATtE1s95mMQFcoul/l6IY3bhY0xjag=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	b=iEVFw3olutOOEmJNeXA2qvXUTbzriQCkK+xsuZOTZePJdvq9LErqi56ZFkKpD6Ydat6xATLUGcskGmzMWYaRrhjcv9GtTVq4govvCpFhB7vfGcA/n4g1w8azi56IzW5XPAlyuhUbyiDJnfV3uKpUjnjTMIllXaVkx2Uq3lkidgXsndHwe7KM/pcWEwsrvnmT7IbkPvq4L9wie7iLfEW4jnYmm0L4H/fcS9LJmRy/7DsWOBEuSwxkLsTnf4Wn+nnBXjxpY4RNdhVxMpjEzI0Ojc+DBFKFbIwB7FyMVdNTfKeZ+BL6FMlQSrQTkort7s7YyVXhQwuhIWNNaxg1D9lM/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uA9lPZ/h; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uA9lPZ/h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WskZT46pYz2yDp
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 18:37:35 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-533496017f8so5416227e87.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724661449; x=1725266249; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGxn7htxuwUZYATtE1s95mMQFcoul/l6IY3bhY0xjag=;
        b=uA9lPZ/hqxG1E1LBsircuEUDC/5R3gHBBktjH+OevfQvzYH0sz/eWpwLp6TxEyl7W6
         oFqTTwWxQgF/FYV6I4k7L7wgpfgUnEW+q54aOXwD7+cyqqMoQNUwJS312BHtVYUzeRcc
         jTFo10n3yA2WSo43QQ+cqG3z+W4nnwXBeiOSNlz/jK8/0rhiPUbJvsa7j1sel59ooHgP
         zg3bgoBLFM9gNPMgW48lO8rwBMGi+K7yKD+gO3P5lHoZoyAiJ07EVRUu/zjigjX4Vb9D
         fFi9nLCQXmupwR7pS9DWvfWF+03d1dFbCTnZlQCXg2EpKGwhnYntt/LuirGOAW6cJ2W0
         lIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661449; x=1725266249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGxn7htxuwUZYATtE1s95mMQFcoul/l6IY3bhY0xjag=;
        b=rj0HCGFWAH0igkI/+Sxsy+/o6suvdIBgguTsPNadsBM2cgcf0t2ryMsiB5Fs7qSUwT
         J2Uc7GNi41Ro5t0PbPDEwDQXLr5HG7bVNoRnZXhfc8+cuQmWMtVlOVZbXR9oCEHv0zAh
         8N4D2/wy6rtKm5xcMBf4ktnyKzjfW6Z6Jb3bIdKPEUYoa/xIHKFocysz9IludcX0KWFD
         cbZqzARxhGQjF1WtvDBZAZaVzC174AtWfqrZyJ/rMEZ03YtVQ9t8ptGERdowobKJpxp/
         Df2Ex8BIW0SzA9pzYtWIfRJW1sqZsT2kc0Ed9G7MSuOobOgblBBh84MGRHwnWtwVW7tJ
         Jzdw==
X-Forwarded-Encrypted: i=1; AJvYcCXVTAgaUZo1uSgh9KaBHWHOlZucYBPdW1ZfXgtOOwu8IVBLck3oQnuVm6G29obHraxhdCT5AYJvHBRHJis=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhKHTxUtUucRgYy0scVI1EdBJm0kjluDDkzZJi1kRBbAqm4Q3r
	wNx52Vpz6gcZ3nWcHmuoJmU29J3YSjbRuyhfFfJolP4z5eu6WCUCB1vy9TodDvoCv7GnYyIoatO
	I9RClEVzBMdein9MMtV5vmlxkm9Zg25MAzanCOQ==
X-Google-Smtp-Source: AGHT+IHeMj7YBiO18vWqML21+FRq1pFZqa1ADKBp7TehE1pILknI7LCAogJhtpZ5d4cDOjaBm1wLNKiaVP0+mEb8qL0=
X-Received: by 2002:a05:6512:3188:b0:52e:9c0a:3522 with SMTP id
 2adb3069b0e04-5343885f878mr6873547e87.44.1724661448779; Mon, 26 Aug 2024
 01:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com> <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:37:17 +0200
Message-ID: <CACRpkdY-sNVdb+nSG4WLZnkj+7jvQ1D0t0Sn+gvOBgCfzvr2fw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, brgl@bgdev.pl, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Billy,

thanks for your patch!

On Wed, Aug 21, 2024 at 9:07=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin=
=E2=80=99s
> value, direction, interrupt type, and other settings.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
(...)

> +static inline u32 field_get(u32 _mask, u32 _val)
> +{
> +       return (((_val) & (_mask)) >> (ffs(_mask) - 1));
> +}
> +
> +static inline u32 field_prep(u32 _mask, u32 _val)
> +{
> +       return (((_val) << (ffs(_mask) - 1)) & (_mask));
> +}

Can't you use FIELD_GET and FIELD_PREP from
<linux/bitfield.h> instead?

> +static inline void ast_write_bits(void __iomem *addr, u32 mask, u32 val)
> +{
> +       iowrite32((ioread32(addr) & ~(mask)) | field_prep(mask, val), add=
r);
> +}
> +
> +static inline void ast_clr_bits(void __iomem *addr, u32 mask)
> +{
> +       iowrite32((ioread32(addr) & ~(mask)), addr);
> +}

This as a whole looks a bit like a reimplementation of regmap-mmio, can you
look into using that instead?

Yours,
Linus Walleij
