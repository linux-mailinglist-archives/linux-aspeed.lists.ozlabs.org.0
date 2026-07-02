Return-Path: <linux-aspeed+bounces-4332-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d2R/BTqwRWrBDwsAu9opvQ
	(envelope-from <linux-aspeed+bounces-4332-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 02 Jul 2026 02:26:34 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A4A6F29AE
	for <lists+linux-aspeed@lfdr.de>; Thu, 02 Jul 2026 02:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=MKVkLHEq;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4332-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4332-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4grHkG755Gz2yfD;
	Thu, 02 Jul 2026 10:26:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782951990;
	cv=none; b=dnXCiyva/c0yGoYwfGvzgiiF7w6npaSG1shygygtQLgowD1P0iZgQ5LEdBvnTyuz/aNtEwjqC/Bjqz7MsMrDYpMuj69I807BSEuvWgQxZYK3skZ/5g2+yGCsOO5R5TJuAG7eB3bP3hThf/yYgPWNwVwoiRZYovL0asXGSB57CZ0lfQpWpQmWLNnRznHPS08GpEQVJgYVifvjr+gsq2h6QL6BPj60aUmTICfia8Yu+dbkT3lBFeX1fznAlPijhpz2GcgNo3/WtPP3OIrbYwzjT1b8te9PBPATQhdxf5FDOcB2s8pzrB5N+0124oSECTC3SOXSVXaQlvXMDFpYuDEHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782951990; c=relaxed/relaxed;
	bh=ggKY+PiY/XL/TlUzVFfVrI+1Nd0wMZ3GupLpt3JkIXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ft8UQq3lC2u1t17PLn0aqymoiFsuNZPNMme0gRbku1fqydEOehhMgBD0BjPNEC//abSqqQx75vh0QkvdLu4csfRKh0aAhVrzW5f5dPKFt+5VcTYZtbG84hCieXPMSGKPdlk0eVEzeEI1d3k1TjYb7bNa0qwAzGWVFD6W+bIRAnRztpGsKqWDqMtB7aq0+zCdqVBxrMw1z1nkDkEVk/VkmEIKZsfVlVMbAqpTygtAavFI+kv9+Qdt/qcKALki5LK9cNEfLodzZEVVd8oMKRm04jqbrVnP87fMapynuWOQ3DuSvU8tCJBO1j52KvYazpM/OXkpQ4cIoetWfSDUguZHHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MKVkLHEq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4grHkG4GZRz2yf9
	for <linux-aspeed@lists.ozlabs.org>; Thu, 02 Jul 2026 10:26:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1782951990;
	bh=ggKY+PiY/XL/TlUzVFfVrI+1Nd0wMZ3GupLpt3JkIXU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MKVkLHEqSw5DimCEOHwHKrc1/BWkRhGWgS5Xuz4jz5WMGFWR1Q3qEDr9EIkT0aFS/
	 tCNZJOe6YNAuZaJ2pEPzl2Az7jcdQa/+9sDSgdDBKiSuiwZjRC0SUDD8Hia5/OTPUq
	 9wxuDAcDZb0QZ5GAChaGAcBgBKksNBOb4ebOcb1EzxsoCylDdLUqLE8ZXuSs1HE17C
	 kfFJJD3CePZ864ZkvjomXdPbKrcy/Bufc9Ee/efDWB0lOaftHpiNqnrYG1fvPZxzs9
	 D5fS8nS8s1S5Ebax96vEavxOR1pKpPhV/qv8nCw66ABV0yc2K6znE/Z5Rm+NUwf7om
	 Ab8Kw0tL+Y2pA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B84EF65871;
	Thu,  2 Jul 2026 08:26:29 +0800 (AWST)
Message-ID: <906cd5f479fe4b80ea3d66c236f259bdd644bf78.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 09:56:29 +0930
In-Reply-To: <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
	 <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4332-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kylehsieh1995@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:dkim,codeconstruct.com.au:mid,codeconstruct.com.au:from_mime,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25A4A6F29AE

Hi Kyle,

On Thu, 2026-06-25 at 13:35 +0800, Kyle Hsieh wrote:
> Hi Maintainers,
>=20
> Just a gentle ping on this v8 series.
> All review comments from the previous versions have been addressed.
> Please let me know if there is anything else needed for this to be
> applied.
>=20

Sorry for the delay. Your series is in my queue of patches to review,
but it's competing with other priorities.

Thanks,

Andrew

