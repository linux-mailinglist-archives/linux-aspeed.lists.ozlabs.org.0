Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D0120F7F
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 17:31:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c6HJ42JXzDqTY
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Dec 2019 03:31:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="v75PO5hR"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c6H925czzDqR1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Dec 2019 03:31:47 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id p9so7453584wmc.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Dec 2019 08:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tOdF2v2tnPw84XyFs+DLGKUeb/1Y9vVZVEyHczF+0yg=;
 b=v75PO5hRYI3xifwe8IjjxOk8gXJmuPeTk8r/sebv8k5VXvGx2syxR0H2BKR6+vXv2H
 tXer/YdwJlAMyR6zpiMe252PHatrAG2aKC/69EAn0ZDmqxbtiiKDtszJ1HIgL3DgkLRd
 Y71pqiVAxrAniWaaLJfzb0lXCjDqpPY6au4dWY3RakMG9IrCBjprhEWpW4oSTXYKR6o2
 mdt/kTckQyZGRZ8izFK+O2fSRgUC3kCpertIvQABHrTv22+fA88ER9ECqNDpFSkkqWlN
 vlL4nqfNXTN3xHkdXsyHbGlOzAyx7gQHwXYJX9pETi/63ceapo1lij7b17hsEHuP5nWb
 PQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tOdF2v2tnPw84XyFs+DLGKUeb/1Y9vVZVEyHczF+0yg=;
 b=NJVCUqDzoprXw6gzQ1K9N2ZHIVttbIq782588nufj+9LLTmDceDx6dSE7067y5DPpi
 NuOxgw7uFbRhoPaQffvoTCxC528fvdZ1ZTPtkuwJTSTOMB30DpjGW3ItfovHu49bnRVM
 OluUCoLtxi6BSfCO+HchQJABzydCzKy7OQf7w2/TLPHtyV2xfqU+trkAWu7XShLCB9uf
 iiXdOsNhwP8ZdKq9SshYoXalNC2fuwiqt4WHsJH6LV47UNbPn7B3izKC14fwvSR+BQn7
 3Cis6MxaUObyovrEmNpA9WrYlOGBqkJe+5f/4VuZqslTriU42n07zmfmP2YF1mqp1iLj
 njrw==
X-Gm-Message-State: APjAAAUW8k5TW9XPi4bZaUuASRwqfmGJETY3IczYHTtrbBZTfmXrVMSu
 qTGzCVILUaDupfDSARA6CStexQ==
X-Google-Smtp-Source: APXvYqza4ODdROrK4+NXBOk9wQRDqm6YbdINa4RvvhiswJwObb7hlbCMFzyXEVki5DExzxaNMZShsg==
X-Received: by 2002:a05:600c:2218:: with SMTP id
 z24mr31321397wml.50.1576513902937; 
 Mon, 16 Dec 2019 08:31:42 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id w20sm21142865wmk.34.2019.12.16.08.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:31:42 -0800 (PST)
Date: Mon, 16 Dec 2019 16:31:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 5/6] dt-bindings: mfd: da9062: add regulator gpio
 enable/disable documentation
Message-ID: <20191216163141.GS2369@dell>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191129172537.31410-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, support.opensource@diasemi.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, broonie@kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 29 Nov 2019, Marco Felsch wrote:

> At the gpio-based regulator enable/disable documentation. This property
> can be applied to each subnode within the 'regulators' node so each
> regulator can be configured differently.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> v3:
> - adapt binding description
> 
>  Documentation/devicetree/bindings/mfd/da9062.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
