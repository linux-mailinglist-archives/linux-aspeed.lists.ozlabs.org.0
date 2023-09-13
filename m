Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E681A7A4131
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:30:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CHYnERIn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0K2DwGz3c8D
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CHYnERIn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlwkN0fKRz30NN
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 19:53:14 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-76f08e302a1so415213685a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694598791; x=1695203591; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hP9BgZpYzTdaatZjwBK5GeITVG93c44f7mkbRCIGLgw=;
        b=CHYnERInL5rqpi0xM3srby6JYg8Dte/S4qp0eXN+77JlYSI3S2Kk+y2RkMIaObHpk4
         hj5Oq1+saKd7yUs/DdcMva00D4fFwyfrCWcwNzMVJlR2hkudrpFhilgFAVLv6SK4uoZu
         ehNjqJUsv3+0z/Ws1zinoMRurNcEmjZiOtGhheSXbGyRLfUONiNkmrDDE4fIbk1Ia91R
         c4cL2b8tb2gIWRa5n8np4wzn4471zEsVBXUtkk6KqbRJuH+8nMY/NJji0vqxOqbbEiP6
         9Vk354IqR02alcZ9/qoiWSaTwfLWOWMF6AoJloooz5hpi/n732Jj0MaiWm6S3KM1OvFL
         msow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694598791; x=1695203591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP9BgZpYzTdaatZjwBK5GeITVG93c44f7mkbRCIGLgw=;
        b=FZmSU3s9RDd8/pS99YQoJ0xcbvvCQ6AM3XTJW/g2eYkxwfbyUeeWEgyKGntwvb/dd1
         XFDQKPcbq44O8meMGoscdEi/tPutmHWmj57fNPXFMmp/KYNdIKOu1mLhILfVzLbul5f/
         qEdMPDWjykIYBA3GmJdsPWjE9mxBSlJEu4Qsjx+agZWoOAqN7DNllm7iH75U56710YIP
         AStd2yCYjRKHXzpF5Yh5PyU93ADgwz9307iroclBg+ZxNFtUUyqPQA/4SwqSXQFTGLBZ
         0sGdHZ/3ReqR0rV2acHoF5L9ujUtDjd/SUYyK7Jd44oZc2AJAvtfYa/NYgLs3eXu6rLa
         RxcA==
X-Gm-Message-State: AOJu0YzXi/HZGJm3iLVGEgxfIibYm+dRgFbrtjxhMyDxXbN/LZOqTcCQ
	i/fnIRPT85OQ6+H5aUmcRRLuXpV07QDSUXDQO5g=
X-Google-Smtp-Source: AGHT+IGNiVP5sc9mQ/ubkiteL/ildtgfKcow2m4MhHIopLDA1ikM3eQJoemv0qj1zlTKs3EeXdPUCqynTLVkhVW1XUo=
X-Received: by 2002:a0c:df07:0:b0:64f:8756:e884 with SMTP id
 g7-20020a0cdf07000000b0064f8756e884mr1925037qvl.31.1694598790826; Wed, 13 Sep
 2023 02:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-2-yangchen.openbmc@gmail.com> <26a53f62-d8d0-9583-e675-a3db99c60c8a@linaro.org>
In-Reply-To: <26a53f62-d8d0-9583-e675-a3db99c60c8a@linaro.org>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Wed, 13 Sep 2023 17:52:59 +0800
Message-ID: <CALFa7M_Gov4jd3wxrXWhxuPKbDr+cp8xmuWJCQH_N=a+q03M1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: document board compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f6d00406053a8675"
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000f6d00406053a8675
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your reply, Minerva is a project of Facebook server that
includes two types of boards. One is the motherboard that includes a BMC
and another is the Chassis Management Board that includes a CMC and both
use the Aspeed SoC (AST2600). These patches are for the CMC and the link
you provided is for the BMC and they need to use different DTS.

Thanks,
Yang Chen

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2023=E5=B9=
=B49=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89
=E4=B8=8B=E5=8D=884:20=E5=AF=AB=E9=81=93=EF=BC=9A

> On 12/09/2023 16:05, yangchen.openbmc@gmail.com wrote:
> > From: Yang Chen <yangchen.openbmc@gmail.com>
> >
> > Document the new compatibles used on the Facebook Minerva Chassis
> > Management Controller (CMC).
>
> How is this related to
>
> https://lore.kernel.org/all/20230907064514.1764010-3-peteryin.openbmc@gma=
il.com/
> ? Looks like duplicate :/
>
> Best regards,
> Krzysztof
>
>

--000000000000f6d00406053a8675
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Krzysztof,<br><br><div>Thanks for your reply, Minerva i=
s a project of Facebook server that includes two types of boards. One is th=
e motherboard that includes a BMC and another is the Chassis Management Boa=
rd that includes a CMC and both use the Aspeed SoC (AST2600). These patches=
 are for the CMC and the link you provided is for the BMC and they need to =
use different DTS.<div><br></div><div>Thanks,</div><div>Yang Chen</div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org"=
>krzysztof.kozlowski@linaro.org</a>&gt; =E6=96=BC 2023=E5=B9=B49=E6=9C=8813=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:20=E5=AF=AB=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/09/202=
3 16:05, <a href=3D"mailto:yangchen.openbmc@gmail.com" target=3D"_blank">ya=
ngchen.openbmc@gmail.com</a> wrote:<br>
&gt; From: Yang Chen &lt;<a href=3D"mailto:yangchen.openbmc@gmail.com" targ=
et=3D"_blank">yangchen.openbmc@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Document the new compatibles used on the Facebook Minerva Chassis<br>
&gt; Management Controller (CMC).<br>
<br>
How is this related to<br>
<a href=3D"https://lore.kernel.org/all/20230907064514.1764010-3-peteryin.op=
enbmc@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/all/20230907064514.1764010-3-peteryin.openbmc@gmail.com/</a><br>
? Looks like duplicate :/<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div>

--000000000000f6d00406053a8675--
