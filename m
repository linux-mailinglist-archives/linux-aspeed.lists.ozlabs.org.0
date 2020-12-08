Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9962D2562
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 09:07:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqt886rjWzDqXt
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 19:07:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r8m4Hfis; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cqt803G6FzDqWN
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 19:07:28 +1100 (AEDT)
X-Gm-Message-State: AOAM533hg71QqXlRnbUCND7eq2fTmRZjerrk82XxCdLpryeyGGLqUJcI
 3yPse+snpWtcJW7zROHplm+I7utEuLx9c8TLmXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607414844;
 bh=otTg+c7QAXplE6PaI0eJSpQO1lpgIBn9zZvXDfCTp7I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r8m4HfisAwjB45X+LRbPQ9W/t+iLgz/0Z85RjYBwrevUpn09p96sNjrSM/oou5zPG
 SQAd+kkfVg0Sdof7okZnCo6MZtQwNgVuz0EVMSJUpcdvhOGjPKtGLQfBAM7vZ11rRr
 ePH0rfhKquOaJBfZQDa3JYWU5vmRZ02w9svCOuQwR3K5UCLYfIqJhx8WYSkn2P11si
 7+/6Z/mfr0ReT4+EgF8P5m/GdfuRGLy8tbr58HiI0HfT5DBHkLAOrlKdi80bKzfzxY
 dRAbVqNQoYX9C81ibekd/QOlczTzNNYGZkt92txyG5c/zbzryMfMxUhM+yNYcszGNJ
 SZM9ntjKBx41Q==
X-Google-Smtp-Source: ABdhPJyhseclVDLIl2PazioASpQ8u3nu109+YNAG72MwwAO2zS/lbV7787tNxCKpN2kQAyRBktlv/wagXIFcRq6Ua9c=
X-Received: by 2002:a50:ce48:: with SMTP id k8mr23429672edj.298.1607414843195; 
 Tue, 08 Dec 2020 00:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20201208043700.23098-1-quan@os.amperecomputing.com>
 <20201208043700.23098-2-quan@os.amperecomputing.com>
 <CACPK8Xcs6ED5C_2RHrG0Bipn8sjPK7yBjcYvJ=UT6w2SRm0swQ@mail.gmail.com>
In-Reply-To: <CACPK8Xcs6ED5C_2RHrG0Bipn8sjPK7yBjcYvJ=UT6w2SRm0swQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 8 Dec 2020 09:07:10 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcu_KZq=e4DmerA_Td6ZHtmM=A6ShXfFzrQCasd8-Kxsg@mail.gmail.com>
Message-ID: <CAJKOXPcu_KZq=e4DmerA_Td6ZHtmM=A6ShXfFzrQCasd8-Kxsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
To: Joel Stanley <joel@jms.id.au>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, allen <allen.chen@ite.com.tw>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 at 05:41, Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Rob,
>
> On Tue, 8 Dec 2020 at 04:37, Quan Nguyen <quan@os.amperecomputing.com> wrote:
> >
> > Add "ampere" entry for Ampere Computing LLC: amperecomputing.com
> >
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> > Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>

It's the first version of the series already with Review tags. Please
post them on the list, not off-list.

Best regards,
Krzysztof
