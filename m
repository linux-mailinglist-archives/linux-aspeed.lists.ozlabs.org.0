Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DCC26567D
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:17:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BndC52vXCzDqjl
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:17:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nwOJbGJ5; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BndBz5hGLzDqjj;
 Fri, 11 Sep 2020 11:16:59 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id e23so11524370eja.3;
 Thu, 10 Sep 2020 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCmr6GtTRUVNMstlQGu5HfhuoPvjXOmhgGjk3oqJXP8=;
 b=nwOJbGJ51iJS9jtAMnqK7Mm5zybB2q3TkewTWxpS2zj8xyhXGMLedCMmXmrPzs7oS2
 zSeD2YzMLSrMu5LaX3YpAg/+prqmC7yhd8lPXYfIHA0M/hw6OTDyW3AFrEdNf5oPkTEX
 iFRNxsoc2P3AzxDHx1/eiNpFAYbT+bxbE5nMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCmr6GtTRUVNMstlQGu5HfhuoPvjXOmhgGjk3oqJXP8=;
 b=G/6dAzt34XyqaZ2vL8f/Z945Ag3cKRUCTO1Pg3YUhwkMiK0XoVYx0HRjg6KKBlua5x
 YuRsCt0lckmy3jIJ3U9vCJicjplxJqcWJ08GrxICbQcXpoHwVxJAEfSLCh+b3oZAsNDA
 6s7H8LHADw/Lz7qflKgAlQa/qWxmv3yx/CJdmD0wOai3YY9hKhaHgIXe8Eg33Nxf/Xjg
 JM+nba4dSnQLXgmdE0TK+oH28eU0wQrom7WOqKNiV9HfuRSICQ8rRHzVjgWMaVzXQYqR
 j9mejXrZ4yXpLglPFN7DafiipAKLe4ly9/cOkdb8DhMSbkIq6/fhyP9WDRWyi10FwehU
 QgQA==
X-Gm-Message-State: AOAM5335HtoWTcy4PvbN+RYImEXIED7u4mPb/PvJ+CvJmgr/RVghI4Pg
 Bd2DMzASvWfPyslrT6okDu76C/1EGz/lx7JE4Iw=
X-Google-Smtp-Source: ABdhPJxznsa97+hjW+1Lf952YVMsO/Bg3uH+xCCYEp+PmEnbqsZ0PhKvpFXk2mt41KaSjH7q9joy2tNFywgTif3/PSI=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr11400758ejx.215.1599787016868; 
 Thu, 10 Sep 2020 18:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200910151840.25333-1-eajames@linux.ibm.com>
 <20200910151840.25333-4-eajames@linux.ibm.com>
In-Reply-To: <20200910151840.25333-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 01:16:44 +0000
Message-ID: <CACPK8XdTsDtDAvaNrz7e3hGXdcx_1=A0vPuTiXF7GhnWQrQi3g@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: fsi: Aspeed master: Add bus-frequency
 property
To: Eddie James <eajames@linux.ibm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, linux-clk@vger.kernel.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 15:18, Eddie James <eajames@linux.ibm.com> wrote:
>
> Document the bus-frequency property.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

I think this is good terminology, and it's consistent with similar
protocols such as i2c.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> index a513e65ec0c9..d84bd19526ca 100644
> --- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> +++ b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> @@ -17,6 +17,7 @@ Optional properties:
>
>   - fsi-routing-gpios: GPIO for setting the FSI mux (internal or cabled)
>   - fsi-mux-gpios: GPIO for detecting the desired FSI mux state
> + - bus-frequency: the frequency of the FSI bus
>
>
>  Examples:
> --
> 2.26.2
>
