Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C456529477F
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 06:51:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGJ4G41hVzDqgM
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 15:51:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=S1A9iVzO; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGJ4609PQzDqg7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 15:51:33 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id v200so1236437qka.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Oct 2020 21:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7S+Ge/DxkH9CUYM5ngdE9w4BnrCUgNRtxj8SJF7Zxcs=;
 b=S1A9iVzO/2CwZAsuuw7v7Aqajmblbv1ifw6clkwdsI1ijOdOXrZFuNSbOtNdwJ/Jr4
 mM6fvJs1Hig3zUMTj+a8yxATwbVR5KgdPHEo3vre+qW6OUYbKwwGs4IDwei77DacrDM5
 29K2oTYfrsFgGi0p6JCTnfqW2uwtlmKWz2kHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7S+Ge/DxkH9CUYM5ngdE9w4BnrCUgNRtxj8SJF7Zxcs=;
 b=Fye14uEJSjHB6rd2d/vGK7hHR1+AF+lm2fG88unh/FaIxouW/cxmtUpXh5qfnhFfnm
 Ah/siJOnIx7obRij7DNlNOOQzkXkVfjTgxJBJnnw2UGsDhAMCpZYNTKSY/jJDqNU+5V5
 NuobNVqQ8dO1diTcx98Kp4pBH6xusAVqtVB/vkAwaixsHJ63gAdnwh+I47BbaUBm080a
 S2Tzq7iWpiNdgn/Srj6wpJPb8RSQoIfQOrcwRgTuTnJzpssv5ydB3vOd+LDZZa2lJtBI
 5DSJl6MwMlFHLMbNyNbobJrqZOdvT1HfEmICNVImHNKJCZtNkly6Nu8/0KRbQNiU+d4p
 LIPQ==
X-Gm-Message-State: AOAM530xWpAxzeh9kRP6+neoeHeuS0ZBPNNMfRXQGuoMM72gqfQec1eV
 3/yMzymFDegt8YMo4zotQp+DDEwnngp4bUKet9s=
X-Google-Smtp-Source: ABdhPJyOqiPlkiXcnTLhnLMYTXkl6P2IifPhUM7Ht1EKmmNBup3yA5+KgVfY5MS0R33Hwo6up58TM91d0R+UyZiMm7E=
X-Received: by 2002:a05:620a:1e7:: with SMTP id
 x7mr1512189qkn.465.1603255889394; 
 Tue, 20 Oct 2020 21:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201016043513.119841-1-andrew@aj.id.au>
In-Reply-To: <20201016043513.119841-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Oct 2020 04:51:17 +0000
Message-ID: <CACPK8Xf1=YEApovVOCbE5dkM3uK0Lsx2iXnVK6nK3mx=+q4jpw@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: Enable ramoops for Rainier and Tacoma
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 16 Oct 2020 at 04:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi,
>
> We're looking to improve our crash data capture for the BMC on some IBM
> platforms. This small series enables ramoops for Rainier and Tacoma.
>
> Please review.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Andrew
>
> Andrew Jeffery (2):
>   ARM: dts: rainier: Add reserved memory for ramoops
>   ARM: dts: tacoma: Add reserved memory for ramoops
>
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 +++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 9 +++++++++
>  2 files changed, 18 insertions(+)
>
> --
> 2.25.1
>
