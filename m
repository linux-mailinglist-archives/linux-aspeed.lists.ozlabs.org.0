Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CCB41D6C5
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Sep 2021 11:49:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKpPN4pGYz304j
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 Sep 2021 19:49:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cq3rnTHp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cq3rnTHp; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKpNc1ssrz2yKN
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Sep 2021 19:49:03 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id t8so9042164wrq.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Sep 2021 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=llOBBt4Gg+T9pqqsZvZwGFvS5VWM4PKtaHhvHx5cDu4=;
 b=cq3rnTHpiJLC7u1rp+dTA4Tkn8YnC/Uxbx4zk7KGYupPqBxF2H6F4mM09fWB4D+zFc
 +XAyfUPNGzah5S2uhYBiABCnXIm2DpXiY524KFwd8XMgW8u/0MMKWXjqPMMscNfyV7lG
 ucb9J69p5dJtHiRrmEbTjDuveAejBZsNWLFKIuEhOKNwufDQB7BeW5/BHvCRudRMFn8t
 Gw5Ifhz5DSsGzxMXC48iw+2b/gRnzNxOTtXzcxFfM/3+lbPsfRXH3EXKNTknsSo0iLQr
 6oYgOsjqTI0pwxkePg2Bl0J/n+KObkv+mL42GFG2G06imwu2sRtZha4zGObnzN5yNCal
 4jRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=llOBBt4Gg+T9pqqsZvZwGFvS5VWM4PKtaHhvHx5cDu4=;
 b=bXrBrFhYCkJW8JW6d5vHT0XprYXCDMH+cPH7ZRArdnAxUZVUWT2rEl3LRRggrqjKoz
 cWs0c+iJXc8Wt4EhXHjVkmaxCLRj7BNqoXwItay2AWg9wMkEeM/Yw5L+Hvo/yJgdtj9O
 3kx79HM2uHK3M/KNWLkDO49yOItncJEqk7/VcQOrfWhEdm1gYGAM9fa5G7W6cJE0hABQ
 S0ti7n05x1QCEU8sORmtgBOfcfsjye20/dYTbyWUiwg/J9QnSBKxK1TqwiECx0hw9ek+
 Kf3p/EsXE+5ZPUdSC6nrAnYHYVOvdskOgsja0fGUUUrE3jVKu4eBlV//fxOqHMbyOM8w
 EPGA==
X-Gm-Message-State: AOAM530C63LwvFZYKeSgmhhkb3YRIb/kR863IJevu5D6iOMkwBpbCAo1
 8zkJ4kfQfsFQB/9oQaT9zFd1pQ==
X-Google-Smtp-Source: ABdhPJyt8cvU9G9LKfhdgUEJfpJ+vPB6W8X7llmrHiV/Xto7jNbE0aL8sJgPNIQ+nPVS7QZyOgnOzw==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr5092711wri.89.1632995335610;
 Thu, 30 Sep 2021 02:48:55 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id s13sm887561wrv.97.2021.09.30.02.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:48:55 -0700 (PDT)
Date: Thu, 30 Sep 2021 10:48:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/5] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Message-ID: <YVWIBQFZaGXbeg28@google.com>
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-3-chiawei_wang@aspeedtech.com>
 <YVTik08lNtDRGn0L@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVTik08lNtDRGn0L@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, osk@google.com,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 29 Sep 2021, Rob Herring wrote:

> On Mon, 27 Sep 2021 10:30:50 +0800, Chia-Wei Wang wrote:
> > Convert the bindings of Aspeed LPC from text file into YAML schema.
> > 
> > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
> >  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 188 ++++++++++++++++++
> >  2 files changed, 188 insertions(+), 157 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> > 
> 
> Applied, thanks!

Are you taking these now?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
