Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E20EB32129A
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Feb 2021 10:04:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkbqB0HQqz3cG0
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Feb 2021 20:04:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yL7TzNgX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yL7TzNgX; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkbq75jV4z30LH
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Feb 2021 20:04:50 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id v14so18185605wro.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Feb 2021 01:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ibd7IrQ6fNOcWrwjYRZXsDAGOxYzONB2z6r0IEqUmQU=;
 b=yL7TzNgXytnTO6Go+i6klhnStgxH8xwdTDTXSlkHTZW3OM+XGilppMKuTdHTwqL+k7
 6PAJUBv7U86Kxu4+T0MGuOe7BctjORCj2iA8e9BK2rrkx/JsOQ7rhl+IWsO7EwzE5h9Z
 SdsRmTr38GYgbYvNXEmGmMvQwEeI7bPyW8B6irLr3ltRF8FvrZNpacs8KLLAlRmOF6lz
 Qd+bynAs7gR33jdNfKhpfQrnz7C8U+yw+RQ3EA71oM7VwFmv+H3crW17LurcXZnQ69Zh
 bUN6GevDuuY0JYwnQ1pV1pMsk9SPue+arcBYe36VlgItDmpjikMiLxwV3Goy29wbsDa6
 zh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ibd7IrQ6fNOcWrwjYRZXsDAGOxYzONB2z6r0IEqUmQU=;
 b=X4j8kheK92UNHIgYzKCMNchywXV83yTfUdCvWEcLdP1MtxdHomO9/EXW944sc69nYX
 HJ7Ub3MQkHB4CXBCfBB3yohvSEKjHvv7rJSuz4TZHEU5PmBHIJFeSezDizUjpwpCDuif
 yP8lc+/LTWZSfo+efIETN71/9+ogERgrkz9qeNB9OqZ10YeuKNQPBS2L3hO816Tq/A8Y
 fOAwVVkW9YL2irKJhNoLCyMopgqfDK5PnSJXRyR10sZrcsHZIpWN/kEtEsJporS2ht/z
 99ulnUXLg4cRuuj190g8hVMe6WuO5EeUB3l0A+AdNL85tC4UGWFvAOAy8hkKDGDsN3EZ
 IZcQ==
X-Gm-Message-State: AOAM530LfmwEDyzv3Mc6rTpCmvrsddERljTiV2jYAR01mx5oRRemJjQJ
 jZ2QN8J8yCFzCf5L8dRlYvBGKg==
X-Google-Smtp-Source: ABdhPJwOHue/t3T/Gsj5IrX0E90nO1og7r9e8V4bXyiNtpeeZqzFVoqABJfZlXM2xJY6LhyUPWUd5w==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr20403648wro.73.1613984681888; 
 Mon, 22 Feb 2021 01:04:41 -0800 (PST)
Received: from dell ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id u12sm1410725wmq.38.2021.02.22.01.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 01:04:41 -0800 (PST)
Date: Mon, 22 Feb 2021 09:04:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 01/19] dt-bindings: aspeed-lpc: Remove LPC partitioning
Message-ID: <20210222090439.GB376568@dell>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219142523.3464540-2-andrew@aj.id.au>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, tmaimon77@gmail.com, minyard@acm.org,
 linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, yuenn@google.com,
 linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 20 Feb 2021, Andrew Jeffery wrote:

> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
> 
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +++++-------------
>  1 file changed, 25 insertions(+), 75 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
