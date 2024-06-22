Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280A9134D2
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 Jun 2024 17:25:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=TiC6xX/q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5yj95qvMz30Wd
	for <lists+linux-aspeed@lfdr.de>; Sun, 23 Jun 2024 01:25:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=TiC6xX/q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5yhy3Tncz30WX
	for <linux-aspeed@lists.ozlabs.org>; Sun, 23 Jun 2024 01:25:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719069870; x=1719674670; i=markus.elfring@web.de;
	bh=WECqVRv0TZb8C3EeVUwSaylaWepEfohQXMBJFu7n5+E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TiC6xX/qTiwXM7MccOqGzXJiM8o/dpIoCuaAGXGIu0lL3Z2+vQpe3lZNIgE2X7kS
	 thJmUMEfvw1L2Brpg0vdQTpRABf137nKUrUTIWpAfhnCsgdIDftlMZZmWOJq1cQpy
	 pNndir5cSc/kwWMvXonAnP9E9evOd4aV43k46dyNYeajDWrulZOTcHRPjTZtrkuAn
	 AySA9dV5A2ClcTF+y9T4r6vChAFOpepBsiHdp0TJfOO2CknUodTj9OgM+O80n8Hai
	 HHt3QZpVEil/Ho102vR/h+rf9qp7czrhCSRg1YVPXRr4siKGiOBkvcJE0zppEcaNh
	 ++pne4RzU+7MgZjIkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6091-1sIZtd2lpL-00DHjP; Sat, 22
 Jun 2024 17:24:30 +0200
Message-ID: <bb23a7b0-dce6-4359-995a-2c12cf30cfff@web.de>
Date: Sat, 22 Jun 2024 17:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Neal Liu <neal_liu@aspeedtech.com>
References: <20240622095618.1890093-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: validate endpoint index for ast
 udc
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240622095618.1890093-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yIDH9MnOrIf0xCjyLzgV99kn2dkVnUILL8Ig2mwCXjJ1DMn9JRf
 hwtJM/HMYJDzvWmRpWzeOVbgEWfOmdeqpLtVm6dy+WImF6+hxuh41iczAODFZj+4EjHeylD
 RWJTXrMJlJBKN5/aXx+aHfGF1vixbncCTvj6umHs2Vf0oeLQkx7xdhUDyhs9scmvZz+rlIc
 KrfidPgw7I1m/gpW/02/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BtDLJqtpZP4=;YBAa051E6UtkLYeabXtx0bDWGu/
 O3XQy4Cw5LGx+hpgnHBQF7I1hj0zHDYrqkcxs0vfCcNBZ7MWjhJDV4XzO9n2OSExZMaCegZUX
 vEaznDvYvvI4Q6kIunFKmKtqeedik/tYOq1iyfwndJz0UB9YkQbpNQkg6SZW8rQ/uhX9V+fsU
 0Oj9GMYfVFceTioDSTBp5MPOcXQGkSc+FFKsQsAvRSr9+OXiQpZgOFlZnZNFAvMvsYvMc6Lik
 KkTndu3bUBGdu1XsHLV7L1t8NlxoAZn5/666WLlY459CHusNOwHSf18g2hHo+sbSN9OoG5jjw
 X9kcDRBXaEJUCdONvGS/rQQpp5x8c+MP7JBEH6wkIhBRd7CytNABNLyUMKPURBPcRWztrY2AE
 PHWbs3SqMnpm2WFqOgjfoyTGWZ427jhDnJRzgZANAkD2Vv6oksEp0dgeYP8GOJ5dnyJnUluhw
 3XaKyDVr7pfVxNcBcEcH6Umm1ypb22Mk5FZSfdT1MDgyJ55MNXHPMHHZNq0onLkY53unuZP/1
 kU68XdYcktGMkNnebqcZBQzhe1ZR4yJztjIPCmhGj2l/ttozoYQ11kBiHZbmmTXIAFTlG8Enh
 EzxzstMLsev/GzqPD1idi9+8P5gGvwoPTkStZ5j5a6NsIefh/fA5OL9PLiZuAK5e0sZlpMFHi
 kYlqQLs6SP0cOZh46dqHIPv2XP+bLl3u6e+l0MN0lofv5o7lWtXgjbFo+uwKCbnSNKIgGQNeL
 w+x9kUlgGE885pW5DbqiSdSJufJZfWP9pKdjggWsQ91JBcumc1hs0bnRzd1P+hJ/1D6rS3Jd8
 5GmvR0yOUG+rLGwqv83NIZxwadLxHplV9kJP2OiEhni9g=
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> We should verify the bound of the array to assure that host
> may not manipulate the index to point past endpoint array.

* Can an imperative wording be more desirable for such a change descriptio=
n?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.10-rc4#n94

* Will any tags (like =E2=80=9CFixes=E2=80=9D) become relevant here?


Regards,
Markus
