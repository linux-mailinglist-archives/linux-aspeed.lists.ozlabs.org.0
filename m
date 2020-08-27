Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B22551C3
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Aug 2020 01:57:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd06535MXzDqld
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Aug 2020 09:57:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=schaecsn@gmx.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=CJQLvcIY; 
 dkim-atps=neutral
X-Greylist: delayed 347 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Aug 2020 09:57:40 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd05w6ZCRzDqg8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Aug 2020 09:57:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598572646;
 bh=1hiWDO5qubwA61FDSyJLXx84okVXi/UAVFmPbOBlmOg=;
 h=X-UI-Sender-Class:From:To:cc:In-reply-to:Subject:Reply-to:
 References:Date;
 b=CJQLvcIYNl5f7rB68Lm/ozqW7LPtbCKEHjMPeYNh12iEr4aqRJwhV0NgS9kKgKwgJ
 uG+lKuFiBlgPeDuAaFN3R8QZKS2fPpnEMQ1ejScQe+qqjkCmydszmboNZEo3gO1aFE
 qNGWB/BOQ0AYEXSALjoc4bNiEgEoMznQYrMSPSV4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.43]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MIMfW-1kPn8i3Lb2-00EPgL; Fri, 28 Aug 2020 01:51:09 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id BC4D489976B; Thu, 27 Aug 2020 16:49:36 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Tero Kristo <t-kristo@ti.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-reply-to: <20200827070743.26628-1-krzk@kernel.org>
Subject: Re: [PATCH 1/2] EDAC/aspeed: Fix handling of platform_get_irq() error
Content-Type: text/plain
References: <20200827070743.26628-1-krzk@kernel.org>
 <0D9EC2D2-C4A0-42E9-94A5-DCFBE7BFEC43@cisco.com>
Message-Id: <20200827234936.BC4D489976B@corona.crabdance.com>
Date: Thu, 27 Aug 2020 16:49:36 -0700 (PDT)
X-Provags-ID: V03:K1:azkzLvPntcmTm1iQW+tTZY0j0Bw8xT/ONekQtE1unQJo5A5nksM
 0GJNUHDntBKfW9JMgtHXOgakjgRZ9d8RwKK3LuJjW2SrBGuCcwnSAijTG0S5i8xcdnLb5zj
 7F5iRtWFoR1v5GeCwmcM5Xh0GLc1mrCjBLQ6OeRXvWaOIQY+5FyMcDI9fcDSpCObJWsjAO7
 obEjJZR8JDf3it+0pJQ6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3r8q9FeereM=:iigROZm4TZPigfS8J00iuD
 1n998GvlIdFYCRXB6N4ynEg0ulALHg042c7cUL4ZGl/Xw8MJBlCXtjydICBaQRdLGNmRLR2+V
 kpnjzvSE1bJVrrYUcn78z2IxQPuzwrD+h8am3gO+b1Qgtpd+r4Vwv3Al0M+H4x2YPhI0FFgoM
 /BIoW6GIsjsPVyJRv4DM8nO2CJUD8+EyZW1Rlq4qP5D5EFbo0UbQgpeqZJ4Me1hIOO25+JDnp
 rpCq+e1ic7XdhEWSoYRAd1tMHOdA2PMyg0YpKpRElp8RLpEx8+cn87NfLsilorbwrrFV9nkMv
 D+QnGoUvbhDKs1CgA6uKtnypv2nVpIw96d6q2tuC1Kmuk8FWZ0Mk0Y8zHrEfGivNk+IlN6wvf
 64bHA5WIJoJsf6/mKJf7YiFrBHA2AwICKGJ2Hrw0AvBmqw+UO1GNToZE+9OGxfj+YDm6Ls+D/
 j77IRbblOyCBnxk6hOAcLJ7Xk6G3MRbW00CT/Cwvmi+09Yb57G1oZTkZXSmEO4DJ/yzE8Aqyo
 AJywwqdl8ItS3PnAYyxlY3GnUCyBZIaDnTHFJdIibBtmpAFOXYROXKPLo3P3uAxrVf0jmKC3h
 Dcu43PO7QLXFP9+3G75E5j/Oahzfkk/k62ewRfagykxmzZ9k0RQc3/C7ybRM/Y1USWSQgUo5N
 m9GdP6kW+P9SCLND0JmQJjyvywEEMqCh6drRCh1TG8HtqGAclqPxecKHAn3RzIf3t4rV3q5GY
 tkHHT45Iw1UGalaDpXy72j49fSSNkLP7huWa4DKNT2cYTo8Ze4WhrcjtZRmL9gqm+s4Wex42W
 tLpwrxfMovfxEkuGoJNQETYULAZpwCk5FqLGrYIkqC62AunJW7Z3w5s+QuMGZN07iTRGj9Wes
 2Zfq90TSvhKYF5ZlY3ql6NCbpFjNNogBTYFPKVOm4sqKoWiKhaZVmw9OWa8CsZV0mnSpSzxvm
 ENppQzN/wnouvoQnZXavOMsjsydiVtdVup+daL02fNGioL5UT7/RqnMF65VoN1GwMJBb9jWEn
 rROy5CQ/RSOaln9MocSIffXW+AbW9D1+aoFFSMwNc0uGE5gr46rOfdUPgFfsJs/XByZ6W4gCU
 +hMClC/C4cZH4DePw8vApRckdAll9chX7HYM6dd1gNdXimG5J9voEMMVzqjbefNYeFQThbjH0
 P9oZRB9B89r6HOP6JU6eE7xbf93KQaICKQArGrdVjs3z0bJYei3p+XU85cx0+orKAAmoRvfnD
 TxS57hg6PcXNqFd9NrGKeBKwVQbg6pCUt5vVfYQ==
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
Reply-To: schaecsn@gmx.net
Cc: Stefan Schaeckeler <sschaeck@cisco.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>  platform_get_irq() returns -ERRNO on error.  In such case comparison
>  to 0 would pass the check.
>
>  Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
>  Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Stefan Schaeckeler <schaecsn@gmx.net>

>  ---
>  drivers/edac/aspeed_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
>  index b194658b8b5c..fbec28dc661d 100644
>  --- a/drivers/edac/aspeed_edac.c
>  +++ b/drivers/edac/aspeed_edac.c
>  @@ -209,8 +209,8 @@ static int config_irq(void *ctx, struct platform_de=
vice *pdev)
>   	/* register interrupt handler */
>   	irq =3D platform_get_irq(pdev, 0);
>   	dev_dbg(&pdev->dev, "got irq %d\n", irq);
>  -	if (!irq)
>  -		return -ENODEV;
>  +	if (irq < 0)
>  +		return irq;
>
>   	rc =3D devm_request_irq(&pdev->dev, irq, mcr_isr, IRQF_TRIGGER_HIGH,
>   			      DRV_NAME, ctx);
>  --
>  2.17.1
>
>
