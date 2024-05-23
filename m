Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 11FA78CD78D
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 17:46:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=svLxltUm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlXQ4494Mz3w5Y
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 May 2024 01:38:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=svLxltUm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlXPt2DBpz3gG4;
	Fri, 24 May 2024 01:38:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716478669; x=1717083469; i=markus.elfring@web.de;
	bh=9+nxfIAX4pQNUcpluSGV0XxummSpstZaxeh2ZeUEgLM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=svLxltUmJKc5H6C+lrIx0Thh+k1aqmPiG9PfWNsmCyHaWwmOFcb4s3l+af9+voSt
	 gNVXX16SBXkb3/7AYxUodd7o63uZd4xMrxybFzDsogXW9JGcCXLt3nh8EwL3uQVm5
	 BI2457n5a62986LZrx052uibVrTRSy6TVDFEjPB+7bahtf2FIAlPGdKQkwh+42Nq2
	 gqdYE/Fc6Zx1ihflcKYCblq9ijTEyjASqVB9dP99cR7/SnqPcCsf6va3rZcXoV0z+
	 E0lPJe62EuYprpw7TqjopZ58WZhOcDubCX+H7yFCStnVm3MICzf1KS0LnES6YMi6c
	 h9v0y9mXm+h3PjBTEQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mft7j-1slSGy1Rc1-00gDkv; Thu, 23
 May 2024 17:37:49 +0200
Message-ID: <58cb9176-bedd-4219-9816-495cd6b343cc@web.de>
Date: Thu, 23 May 2024 17:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
References: <20240522192524.3286237-5-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 04/20] dt-bindings: fsi: p9-occ: Convert to json-schema
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-5-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6uUBnjXwoYTBl65AmSP4bcUm9yYkqDShAEAbhWM6H189RdKKnxz
 oVcolhaMOwtEJcXr+cktyel6GIa8xr80cB2NMgeeewp511zPje/1jngr+m2B8UhYPxiOGI+
 nCe/2N4ClNmZZHeH0HGzAP2dB6XWRrD6LLsQUZyKrG5KUOaKxlB7/mW0bd+dHT5Qd83ZC8Z
 0jspFu+iLQADHLYV/qm+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AMG44tVUeQ0=;gHcW+AfMMVcn0FO8GHdTGTcE2L9
 JbmxHGHiETfcIxNUAkoM8lPOUnEm8Cqtt8IbTY6kGFJv+eumNedF6Sw1/mAxxYSJJYJKzCqW+
 l8vF3QztykQnys9yOlSdxg0Vu5u63kdNOlfCMlvSidXL3LvNXu0X9DnhIan8eZs4fgrGi4nHa
 j3Ek5aLNqXh1vaRlDi5OB4Ka7IzMh1tNDeY2GWpz3TQCvkLVfHMPTVyW0S4Iiv3A8RVRsKNLY
 PK5N5v7ud2xznfxgj+m2vu7g3aWoRd28rAROp5NE//rgnXqG8OKN3Nfm+32ZWaez+nzUDq2BO
 2tAam1pS4nnBP04SG+oAjdnzovMYU9QjXzFV5VK4OGaXtGEwT1EVadLqVIamBrdMFUbnKrQwb
 JKIud+t1E/NRF5gfXguFUB+0NDYuD/Fq8AreOZBl/aM+ORRH1PFyVaWSqhuVjOLp/3NpyLezS
 whSnFB4snfj8STEEFTzXYZdC00s+DPkSS7dTqL3XsIOKgPTwNGJmDv3pOVZkXPz/nHLpsdj+m
 ROiffKtt3PAO/ZMEzJwartiHNDcgH3wFS0HtK21MqtmMGFr+9FoRoVjhymlVVgKA+KdBCIjo5
 Kwih5/lJqlKyveneWPTaYUKnLnqS7B2iRP5K3HjZTu5KtYZWmaVuYTisuMUNrKISvptS+lafR
 CUE9a3R8BU21soinyJdsfOnX5POH5kla4nHqavWasP+6ZVJpztt81Taa/JsnRS8p8aZkwiTHe
 EFa5OIFmRfak3zG7JhkbjWeWDfuMjEazOVGlyPovZYdlyH+cHSXdJUxFN1L3za80taRr6zBrA
 Mp14C/eCWOcywrKj1Phe2oNFaHQJdWQGTJPdAGqA6GhdQ=
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

> Conver to json-schema for the OCC documentation. =E2=80=A6

  Convert?

Regards,
Markus
