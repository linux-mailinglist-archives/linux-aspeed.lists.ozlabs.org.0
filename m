Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE0915304
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 17:57:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=uKqcPmSc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7CKY4mqZz3dFx
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 01:57:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=uKqcPmSc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7CKQ41gdz3cWm
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 01:57:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719244614; x=1719849414; i=markus.elfring@web.de;
	bh=+a5OFi0RBKQi6uK/ymWtcqYxq19LFosRH4DfuG1lwRU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uKqcPmSc5cEWX/5WSLqTxVpAadxpQhg3mX/S2vD69zcEmn7cPZNbgqbGqgjuY0k9
	 wGD/qg8Hp3gC3hm5UACPntUaXLMjjW8k38+rPz4mqtSQPC2ahX4qbQogKVjEsnnyp
	 RTRoCSMgiZdn8zvway/wGnmHVD6nl4m1bruQX6/CL26np9RlTcSbVLWimVhJ8HS5Z
	 2YYjPr7kY5y2hLqz/yAsAQlFe6Un1iKmE0zle068NG0J3pB62SLkKsBM/lioVUUTM
	 cLR0laK4vAY8Z4Uc9HMgdwJe6pUUSVOVGIJQ+0kXpri8MAwDkBfgduexl6uJxpjOg
	 io+eF7RN+LWh5YLp/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MUU6E-1rvTkb4AxE-00OT1z; Mon, 24
 Jun 2024 17:56:54 +0200
Message-ID: <38b7ccb7-633a-4e51-9641-80ced078c33f@web.de>
Date: Mon, 24 Jun 2024 17:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Neal Liu <neal_liu@aspeedtech.com>
References: <20240624015314.2249128-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240624015314.2249128-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n9yAUzR7rUa1NUdrk6VIoK5KFZG38C7bA7iQ/Ktgk0bJ8VD3Nuf
 dU+fU9AXx4NjTI44p5YPf+TLaEZW45Pv9GxIUFd0B5zgG+uUE/CdTyfpTRyr9yJT6CBKv4q
 NLR/YD1jxLXWYTA1x0IoTiPDgGim8Dx2M7RWLCgN9mwONBRJpLTVDkU/HOEhjyD6Jm6y4ZH
 SL7zdzLb0TyHref5BCJpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0mLxJAJCIkI=;TVIVJbyMhGebVxI5qelgVsBOcnR
 g+Atlb32+yBv3tHrc4+REgFzRfbZ9PqYKzQVNafNULkSUS7NtCzWNcLyCzhLIEmrbBglRnvvG
 QOrcX0eX7l04gAzjR2fsZU7qa6AHAtTtjQKcucvOnTmE2bwJqhFdijv3iBb6xvUUapD6pXCjf
 +JpZDVPLeREsJQZM/suVRXLCnujs3VQj2YmxebLirYYs48B70pqFCEybMET9WKjuC7G3bzukf
 dmAYYMsWYwI1n6sDRDpOmwIJGciMhvTZ8g3bdGMOqWefaiueZ9183qNaVIyqiEoeyVIFpnNbv
 Pf0yXU/pHZX+TrnVHS9rWT0cMyCyb+5p+4NasMmODthRbMoX17JuZdm33h+kR2ZJPwHcIBrOV
 njEL2pKzAP3gt4MwNWXzl3obJy/wCfRVd/ekB75Rcbbhvgvi38LCXJULajHC3xprktt98vV/B
 iPHULfcxlWdtD26VUd2fPBcNojdTA+gMwQeonoEpEwwiuW58aFdw1SrKnoTKTFJYW4ar3DevT
 +n60uynf4FrGhToi21l1RIWcRStYkntcextiIlSz6K466mVtUrw7znt9MnAkvPtUOfA3TwcHq
 xB6zKndnwrpOzhZf++Rj2l/MleX6vSxtkNT178URPF4bWjUcVIjy94ARjSV3N1soUR6OIZTSU
 gVF8qILwFIPmHOs+gNHaIfysyAAzVzY3ypIXjCkyo79o3wKxv4lQpruxPW67CFTddYBpzYMKu
 INbHKROPwxffqZMbXMoU+b6hxRWaYVBx4GJFdRsi6QsyK4Dh1iJ9xbwqFTkArbsSQL2DMX3rs
 fOiQoXNxy2LltSsEdA0qT0hFDDvlA52Ln+D+TQ79OEADg=
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

Why did you not choose an imperative wording for your change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc5#n94


> Found by static analysis.

Were any special tools involved?


Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=80=9C=
Cc=E2=80=9D) accordingly?

Regards,
Markus
