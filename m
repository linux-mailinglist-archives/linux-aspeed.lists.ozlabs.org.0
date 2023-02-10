Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F469161F
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 02:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCbSB1CqFz3f3R
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 12:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=j3xtMLqY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=j3xtMLqY;
	dkim-atps=neutral
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCbS273Vpz3cGk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 12:17:04 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1636eae256cso5002198fac.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Feb 2023 17:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2LGF9CQJxY7Jmkt367RwJ3PCww1eRpqv6rheB6Oh6u0=;
        b=j3xtMLqYWTBKQMCxYTgjxrsJZr0E2jlBcpgwt1+uVdbfyJifh852/bTur+vGgN2xOh
         nQ9gfwiABfFma+w1DXM7Z1loJRExOdeN0oVkB6pmv2J0H2DCDo3lBSpKdPqYdrwS1iMA
         IrXIIc2bykxPvXJdHz30Liwm3F0Zb9SImMq2iXnm90TBkAMeTUiHovMsgUL+CkIHpL/9
         D/q003JlmAFsAeEFYvgfcpPnmpUZa5y9OnSb+AtylZFs7vEPF9j8aZutb4g6MLtEJQrg
         /IFUuA5Ipd+NUbm0kN6sd090QzjknvM9Ze3S9OUZbgQcVz/wV7aEaNOmn+aS5Bzc5dI4
         3CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LGF9CQJxY7Jmkt367RwJ3PCww1eRpqv6rheB6Oh6u0=;
        b=rXt+UNrO9+1OiwUDGhYa99dkLkrjJcY4/6svK9QUnpoAc9Jmgyw9kJaUx87o5gSMRV
         cDOZNQtGz2dRdq2EswU40WwZXS7pY8+8ptP/027mOMNlbQb/z9hYEVkPeMHoPBe6FdO1
         r0/OVzgaYDYRLl0Mevhu8v+OQSx4z8LiRsQRL7cGPxG8tRfGTkojnNXOdebLqgsYUWkK
         aEZLtrA/cjn5Lq1uhjP+DUoqxw/Wzkna4Pap87CXUdN9ziB77r91IwiY8F1lUYz6Zpdu
         4XTUBTFmXZ87L0oNBcSl61Vs7CmA1Cs45Fzp447qdc1NAzmTWkefUE0k7LbrHq/lF9QF
         DS+A==
X-Gm-Message-State: AO0yUKVRJmIdxw24PW1moxoGu7XlpzoSAytwjQ4iTPGaK0+/UJLOgFW1
	eIMLwdcgd9JnqHafrmTJ8fbgdKctv4cWotstpoz/dA==
X-Google-Smtp-Source: AK7set+pf7vb7ID0UO2UyYAR358BCuMRdTYqpFZ0UnWc2dYCYW7UZRbRxVoy5zBn1qmUa4gCagPzBtNFyYFsjr+b3Oc=
X-Received: by 2002:a05:6870:63a2:b0:16a:a8b5:16fe with SMTP id
 t34-20020a05687063a200b0016aa8b516femr1187142oap.144.1675991818535; Thu, 09
 Feb 2023 17:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20230202081843.2358-1-jordan.chang@ufispace.com>
 <20230202081843.2358-2-jordan.chang@ufispace.com> <53818676-1e4d-2e58-00d3-ab06b3741fc2@linaro.org>
In-Reply-To: <53818676-1e4d-2e58-00d3-ab06b3741fc2@linaro.org>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Fri, 10 Feb 2023 09:16:47 +0800
Message-ID: <CAJ3czeT=pw6T6bb=tEDDa-4O=ZLEvG_n+4s6x8wvbMawL8QnnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for Ufi Space
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fd9f6e05f44e4007"
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000fd9f6e05f44e4007
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review. Will resend the patches.

Best regards,
Jordan Chang

On Wed, Feb 8, 2023 at 6:28 PM Krzysztof Kozlowski <
krzysztof.kozlowski@linaro.org> wrote:

> On 02/02/2023 09:18, Jordan Chang wrote:
> > Add a vendor prefix for Ufi Space (https://www.ufispace.com).
> >
> > Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> > ---
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>
>

--000000000000fd9f6e05f44e4007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Krzysztof,</div><div dir=3D"ltr">=
<br></div><div>Thanks for your review. Will resend the patches.</div><div d=
ir=3D"ltr"><br></div><div>Best regards,</div><div>Jordan Chang</div><div><b=
r></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Feb 8, 2023 at 6:28 PM Krzysztof Kozlowski &lt;<a href=3D"mailto:krzy=
sztof.kozlowski@linaro.org" target=3D"_blank">krzysztof.kozlowski@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 02/02/2023 09:18, Jordan Chang wrote:<br>
&gt; Add a vendor prefix for Ufi Space (<a href=3D"https://www.ufispace.com=
" rel=3D"noreferrer" target=3D"_blank">https://www.ufispace.com</a>).<br>
&gt; <br>
&gt; Signed-off-by: Jordan Chang &lt;<a href=3D"mailto:jordan.chang@ufispac=
e.com" target=3D"_blank">jordan.chang@ufispace.com</a>&gt;<br>
&gt; ---<br>
<br>
<br>
Acked-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@lin=
aro.org" target=3D"_blank">krzysztof.kozlowski@linaro.org</a>&gt;<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div>

--000000000000fd9f6e05f44e4007--
