Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 173AC8CDB85
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 22:41:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=DflBNhIa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlfyp26BNz3wMl
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 06:33:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=DflBNhIa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlfyg0bwvz3vb2;
	Fri, 24 May 2024 06:33:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716496394; x=1717101194; i=markus.elfring@web.de;
	bh=DIDQ2tYtq8MFdZfE3oj6pVt4+VDDvCMI+FvVKdCMQSo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DflBNhIauaAVPv7df71cbgjmYvPUxpSWvxhEzsJ8ncl8EsS5d4W+2i7KJiQWLzlz
	 KAM6W/3pkgrOLTNBSXh1Sb5Q5aOD4bbQavFraOZl1y6iWIacP4VT4PqibFWbiwCKL
	 ibSe5POriSau7agC0M6rVkJf/GMkS2FKxO3luDDa6B7X5dvz/OmC8VIpTGovj7hKp
	 A82VLkWAwpQDDHs1/BIf2xn3fkAW+q2XUN71UoJZeRktCEE2ATxK8B+NPYsatTgBO
	 0ip7ZzWqPtrL3tVnoS1DQWjxkZTNyRZPdVRnMzIo1HckBhcbn6b/5bGoSIF6rmAi5
	 PwUtMeKL3yAp27Dslg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBSB3-1sEslR0qQJ-007SV7; Thu, 23
 May 2024 22:33:14 +0200
Message-ID: <f90267e9-e62b-4504-954a-0306cb9de1c3@web.de>
Date: Thu, 23 May 2024 22:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <acced98c-79fb-4c32-abf3-66fe93031f36@linaro.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <acced98c-79fb-4c32-abf3-66fe93031f36@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jLabXc4sQh1w4S6fXJXVoj9rwHkBKzpssIKqnS3KTM4STAHIjIi
 kFcGsxBOlyKNoMTI6E4/rdvAT3hwJwkWRnJaCPGBPRd5nG7NqrnTR4b/bwAQFLjzR2cBudb
 YPNThBg1kfbI9hWv8uySONQkiRcTyK+SbhDcPy6mCZH0HU53K5AQtRo4rqsEHNy70WTEMw3
 0sZpRTI2S4BA60StiBH2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZVE0sWfFGGY=;IkuDhKwp5Y3ZkWOdaYr5BeXEQtk
 K5CZqEANOKAKvnJerp5A/YOUgs/WK/X9FFFT8wo0VcMVpW4CVlafIw9BbfpR8CZ0n6q0z8kLq
 eLIdgXnYivKN5O64ot1v3X9BghpK9xMzEBccM9+W7mLSSpCHe7P4SF5synYrfjTSNGxP6VoVl
 Rk8vsWfP6BrlPwQn1qEsJ4lfEaxl14gMN5S2ObPlEPksClbzYm2y1kP58Un2j2IVWXscMFpX0
 iCzHdUsRBArQj/8dPHYyPE2KEyzlA3C0HHYuq0fum5gkkj5TLU+TJEvLBk8CaTe9r2kT5zGP1
 LGzQorh4AtFrg1egbkrGratKE8F2XRtniwHX7Yrw02X+ZOqcS/KU3ZPVqaMYPs/ulDicwTGtx
 mpkTmc0t7Gpm9ZduHiPYuBYcfUjeNVK+KQGELf5LeM6OAhltl8UiU1Pq2kltX7Fc/mt3EFDJH
 5bUC69MjwoTGzc/8Uri3kSnCS+pdAWgQZuVPv2blUvccUIey02FH/pDfnUo44LhaGXTR87fr+
 WXVNA652/YEooX0ZXUyvqNuA+ij5gdp5+IgORM/xpTpDvjdb3wwLl6Q0RvzdojN8kA0GPU/Qo
 l7pEANZizhd0K/MRz0TEVR26cEWMy4BK08szyd0pecvrAMwU1ijtORF5sqOaXVGHMWIWuucZd
 +kMKHYy1yI1xFLwz7jf5MWXLzKe1tz9/Axd+jbJK81K9f40OERuL569Azzdu1SYs0yzFJ/LIb
 4wBvm/3X3CuEx1VHSfcqUWJ0wLWPyJJjf4g4FSJNv47+9IeZ2enQC5Nqks7Q05088LYnx+sHR
 v4QdJ01YEw5gWgwu3YmAPLkodxSd+uGGvPWRtUkgZrRCw=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Markus is banned from mailing lists and most of maintainers already
> ignore him or already marked as spam.

The running patch review can eventually become more constructive
despite of recurring communication difficulties.

Regards,
Markus
