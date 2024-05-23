Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E83C98CDAF8
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 21:41:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IU5MAlBk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vldb01lSfz3w2F
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 05:31:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IU5MAlBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VldZp3jsRz3vYX;
	Fri, 24 May 2024 05:31:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716492658; x=1717097458; i=markus.elfring@web.de;
	bh=TK0k/etgn4gRoJ/jFUnhfFck0IgfY5juULg0GsXhWCA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IU5MAlBkygKlyE/FJFR795c2AV5JmiM+5/V75BfZhIj+xqR0jb0X0xzbnSiUx9Fb
	 4JVOw/WkZXUwK+4g7ujtGM6Z8cUHm1RONLnCsLmgECMWNofAxsrG5/YRlKgYSZBEP
	 kpWEJh461RMrRibNkwLWE2Tu6HnovKMMyOi1ziupgqdNwJRPhnTBZm2rF2L9VZOBC
	 yNfgzTi33Hg5Z09BiANFInRI+tEhnc7GQj58IMSi8DIvxk+6ljYLLPeZHUs1ad1G8
	 kNzqQNw8rXA2LqPCd8lGG7HFYLJlkfOw6XeRlm7Siqn5Ckw4b1kXFKmB6FizkRK0g
	 nzk4iPzZ/YYLPAMHUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWQuP-1s2sfJ1Fwx-00XwPl; Thu, 23
 May 2024 21:30:58 +0200
Message-ID: <398bf753-6701-4925-b814-781a68a75cc5@web.de>
Date: Thu, 23 May 2024 21:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DAGnwtib86FkvFWf5Ytb4zfOvEDuQlQ1LfywcVNule/e6md8cTj
 cZ81CNDimlWAJHud38f4peWZFqWRBbK2Baop2QNPyneIHFsRkJ9KrYRBmbjQ0uQDkhxgXCZ
 dYlQ4D+X5r6RN2N2TWQaiuS4uBeDqtyw7tMHMFmbvhAU0QY/STpENG0YggEXjHAlK08pKr2
 PlTJtlKhF3m6iXBICcECg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AvAUgeT2+NE=;92TPdx7IhOKSe1vyjO3YA8PfoWa
 wzrEU9QnhnZQGo73Zhn8I5Sqdkbp25SsbeS8Z02pMV2BNysdZDsOaNOTnof+7z87NAtoEWv6N
 8d8pKYf7xRyloijiXNSDcwt+eknm4+WUFhFp6SRAsaRPnq+p3t0KcTVqrw2wgmGc3jiqe88z3
 soX5Ky0VnQ53AU9qJbXHaSu9uuo+8s0GF+emLYmv7caQYZxy/HEna+VYuO9apa1HD/5CzvGsf
 BxrgcB7H2hqvH5iQ/KTYkycbi4dsJO8T97sd9qXdeA6dcQHKmYjQTCq/ABzI+Q7cXqXib3MSE
 FUyN/GcKcbhRO6WPeWMef8VUFP/bYkrTCYd8gIWdDjKfaHQVnUK5Q/QIvdHBx2PuOdb3Ol/Fj
 xb7FvqkLGCXp1MS9UkeBc0pUDXoPnqV0NUQG/D+GkuvAtXytJ+qrg8H+wSt6q3BuYxcg24VZd
 TvCiA997y0F+NYclHLXF24tQNkGOhC0GbvoRuLAEMuH23arU5zaTZ6FajoQBnLDYTQsYakRhD
 FIZTvhJSvFfoC8gu/0ygVhZcgmMa3jSwXdc5cExperNWqQhTX7Ut0/pCkVYuWBPAR3bF0kezZ
 83GVaUSOcBqbDBorLCwpzSjrRLrQuxjnOc/+dgrBClYK1Qdem8GI2eYq+f/sZ1Mo8wkWjX4b2
 fG51IQOVVM8Q4KGxv5lk3V0zKtB2w6Ye/wi6fMKjd0mb7iSjK6gR7TuTqVHqOSTHkl203mOIV
 lqUHb0wMjGbSbdmhQq/YovQX434I2QJgtbtuDvoTcMKnH0f4DrrZyTWtnWdB9XauuGnydRs6e
 N0D37WL9Z/2AO/szkiJ5UgnNjIyVVi9tpRdVj3wH+RBUc=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

>>> The Huygens is a Rainier with modifed FSI wiring.
>> Will imperative wordings become helpful for a better commit message her=
e?
>
>
> This statement is a description of hardware. I cannot word that imperati=
vely.

Please take another look at corresponding improvement possibilities.


> The commit message is imperative - "Add Huygens system".

This information fits to the summary phrase.

Would you like to mention in the changelog that a hardware description
should be extended anyhow?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9#n94

Regards,
Markus
