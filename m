Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6255729A
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 07:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT8CM54ZSz3btY
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 15:37:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HM5idz5i;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HM5idz5i;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT8CF3p9Wz3bln
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 15:37:13 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id g18so484492wrb.10
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGXOI1F+46h8g4CYNp3aLfgU6JLkNEaQBiU6ibgVVCA=;
        b=HM5idz5iSxToDddeGwp7+NN6Al4VcX+R7jrtS/k2TsBRWhI/QGJtgwP3onufqCCc3z
         +GcrPimFXvXtyXANf9Lw3XZQRt0ZX6p7MAQVn7u4LCbF8eeX34rVz5Lr4uwPjo0FGVmV
         +Pla3kF2YJWL9MdBWcbvFCwJV+EDL5FhwWick=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGXOI1F+46h8g4CYNp3aLfgU6JLkNEaQBiU6ibgVVCA=;
        b=fQ5JmXrTLGup9R9jfDzy+sdv2C7Z74QeR2sFbDvG6hI42TcSoA27vg+OfQWWlbe5bC
         BExZxMZOSpkdPB3Bz9zR19QFjECi291cJwNu8jfiKzqNJ+Lqcss0B6iqhS5kR0/Wcdnt
         z7NVWDyV/wQ5iNjgn5xiqpm4y0C6p6QP+vL4BOdiszfh5dw+n8eEKks6JeXksJD1wC/B
         REP8mVUEQ57a23v4BiBp1q5RtC/4ivT7iITlb6HhuzzUwFbKa517vS9cSK9Ri+MRuLSS
         JXvCsqc8uuXEgiQm9LkU/awuOk2qVsMvaEjuRCquoZI4iDu0NYVebECONaAphtEjVfUA
         k3ZA==
X-Gm-Message-State: AJIora9Y1+sZVn2w17Z8SHcSGuhHRcy1nGNtGyr85u6MlmMhbnRtywEG
	C+ahBtBwuzsHUFuY0mlYnRAO2n4WHbl/Hn7ylfo=
X-Google-Smtp-Source: AGRyM1sxEHbUFDJd4uwqidyTn0y1zcbD7hXpM+WdCWUtTWrFlvDF18O6m2kSbaO+FuzsJc1bY0QH35P06L8HfegXYfw=
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr6224129wrm.3.1655962630277; Wed, 22 Jun
 2022 22:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-2-krzysztof.kozlowski@linaro.org> <0207c2fe-7c01-7852-3cd1-74297cd4857d@linaro.org>
In-Reply-To: <0207c2fe-7c01-7852-3cd1-74297cd4857d@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:36:58 +0000
Message-ID: <CACPK8Xc=dmaJtLXGsQa8bBdWDnSbwyW3f_yaQr4HqT0WvyScRg@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: arm: aspeed: document board compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ken Chen <chen.kenyy@inventec.com>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jun 2022 at 11:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/05/2022 12:49, Krzysztof Kozlowski wrote:
> > Document all compatibles used in existing upstreamed Aspeed AST2400,
> > AST2500 and AST2600 based boards.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/arm/aspeed/aspeed.yaml           | 83 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 84 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>
> Joel, Andrew,
>
> Any comments on the series? Rob applied only patch 1, so the rest is
> supposed through Aspeed tree. Shall I pick them up and send to arm-soc?

I will take a look at them when it's time to send patches for the next
kernel release.

They should go through the aspeed tree like the rest of the aspeed
device tree patches.

Thanks,

Joel

>
> Best regards,
> Krzysztof
