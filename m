Return-Path: <linux-aspeed+bounces-4006-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NnRGOjT+2lxFAAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4006-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 07 May 2026 01:51:04 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7BA4E19D7
	for <lists+linux-aspeed@lfdr.de>; Thu, 07 May 2026 01:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9sb77477z2xqJ;
	Thu, 07 May 2026 09:50:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:90c0:15:ee::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778067183;
	cv=none; b=OC1+kD8Oh47Cfvp5p+8h66/bJz4oipIWYxqjpAhvKRpgotC51kr4+DJaFTsyzKVyhiy5RLen4oOxjc/CJuVAa1F2W2gCMZ2uWyEgwKjD8MMc3BGBCGSKLx4nKcHn6diZPM2veG0sBpD8MrPV3xnKCja9NMMOYp9/gkzcHKHggsNmFzoseF+Z6buoAwD9otP4HI6gvZR/blkZw/fxPkrNTsJmrsh0upTINw+Iy+enA/7wiKYpbQLBLQ+PBSqB8uZ9pX01T7ziUn4zc30zbP2lzDln8mbtojyTPkzqfsEXg/h6e53O/fbFhVfgZUD2CKgN+TPbcx6Tag9yJZt58KaECA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778067183; c=relaxed/relaxed;
	bh=rqFFGPJK9Yo/CL4zFA7ai3T5RhVKukgSzLlXq8R9IdI=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=B8lQlwPUN+4sRymBp7sLZARcehqPVH9qc+HuiOUOrbC/ZL0o0r866pFw9rgBoZ9WMEw60WntK6jatTSCCSOHoKKCemwJRCuibe0E/jabMBsUtGiH84VO09X2AVROFoBAYVxR2DG06nCpY/fR9i9PJasHMKCvzivLZwa2Dh12Y7PIUIk61DvdPXWz4XCUCQVD8n921gIZbqW2JahgWzllr8tt//MX3+oKAHHCGBcnN+HpE1ko+tlnQcyehkEjlBEEOU/mZglBn7K4FfWn+AblQk5XWGHfNnUZWaTVkmv8wE69KWfab2UeDGO2Yd+0aJy1Mp/vkK5q7OoDzItUFVOwHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=noreply.fr; spf=fail (client-ip=2a03:90c0:15:ee::1; helo=managergram.com.com; envelope-from=www-data@managergram.com.com; receiver=lists.ozlabs.org) smtp.mailfrom=managergram.com.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=noreply.fr
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=managergram.com.com (client-ip=2a03:90c0:15:ee::1; helo=managergram.com.com; envelope-from=www-data@managergram.com.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4650 seconds by postgrey-1.37 at boromir; Wed, 06 May 2026 21:33:02 AEST
Received: from managergram.com.com (unknown [IPv6:2a03:90c0:15:ee::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g9YCf3k4rz30PJ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 06 May 2026 21:33:01 +1000 (AEST)
Received: by managergram.com.com (Postfix, from userid 33)
	id 7FB0E6F430; Wed,  6 May 2026 09:36:58 +0000 (UTC)
To: linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?B?Vm91cyBhdmV6IHJlw6d1IHVuIGZpY2hpZXIgcmVjb21tYW5kw6k=?=
Date: Wed, 6 May 2026 09:32:48 +0000
From: =?UTF-8?B?Tm90YWlyZXMgZGUgRnJhbmNl?= <lesnotaires@noreply.fr>
Message-ID: <a55f53cb9a06595d4e109fe4b9efd111@noreply.fr>
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
Content-Type: multipart/alternative;
	boundary="12260d0f56c39cc9fb232999bc9c9ec84"
X-Spam-Status: No, score=2.4 required=5.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,RDNS_NONE,SPF_FAIL,
	SPF_HELO_FAIL autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9F7BA4E19D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	FROM_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	DISPOSABLE_FROM(0.00)[noreply.fr];
	TAGGED_FROM(0.00)[bounces-4006-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[noreply.fr];
	RCVD_COUNT_THREE(0.00)[3];
	NEURAL_SPAM(0.00)[0.690];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_NONE(0.00)[];
	DM_SURBL(0.00)[noreply.fr:mid];
	FROM_NEQ_ENVFROM(0.00)[lesnotaires@noreply.fr,linux-aspeed@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

This is a multi-part message in MIME format.

--12260d0f56c39cc9fb232999bc9c9ec84
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

wqANCsKgDQoNCg0KDQoNCg0KDQoNCg0KTm90YWlyZXMgZGUgRnJhbmNlDQpTZXJ2aWNlIGRlIHRy
YW5zZmVydCBkZSBmaWNoaWVycw0KDQoNCg0KDQpCb25qb3VyIE1yICZhbXA7IE1tZSwNCk5vdXMg
dGVub25zIMOgIHZvdXMgaW5mb3JtZXIgcXVlIHZvdXMgZGV2ZXogdMOpbMOpY2hhcmdlciB2b3Ry
ZSBmaWNoaWVyIGRhbnMgbGVzIDI0IHByb2NoYWluZXMgaGV1cmVzLCBzdWl0ZSBhdXhxdWVsbGVz
IGxlIGZpY2hpZXIgc2VyYSBzdXBwcmltw6kgZGUgbm9zIHNlcnZldXJzLiBNZXJjaS4NCg0KDQpG
aWNoaWVyIDogRG9jdW1lbnQtaW1wb3J0YW50LnBkZg0KRXhww6lkaXRldXIgOiAqKioqKipAKioq
KiouY29tDQpUYWlsbGUgOiAyLjQgTW8NCsKgDQpDbGlxdWV6IHN1ciBsZSBib3V0b24gY2ktZGVz
c291cyBwb3VyIHTDqWzDqWNoYXJnZXIgbGUgZmljaGllciAoZmFjdHVyZSwgZGV2aXMsIG91IGF1
dHJlIGRvY3VtZW50IGltcG9ydGFudCkuDQoNCg0KIFTDiUzDiUNIQVJHRVIgVk9UUkUgRklDSElF
UiANCk5lIHBhcnRhZ2V6IHBhcyBjZSBsaWVuIGF2ZWMgZGVzIHRpZXJzLg0KDQoNCg0KQ2UgbWVz
c2FnZSBlc3QgZ8OpbsOpcsOpIGF1dG9tYXRpcXVlbWVudC4gTWVyY2kgZGUgbmUgcGFzIHkgcsOp
cG9uZHJlLg0KDQoNCg0KDQoNCg0K


--12260d0f56c39cc9fb232999bc9c9ec84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHA+wqA8L3A+DQo8cD7CoDwvcD4NCjx0YWJsZSBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLHNh
bnMtc2VyaWY7IiBib3JkZXI9IjAiIHdpZHRoPSIxMDAlIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBh
ZGRpbmc9IjAiIGJnY29sb3I9IiNmNGY0ZjQiPg0KPHRib2R5Pg0KPHRyPg0KPHRkIHN0eWxlPSJw
YWRkaW5nOiAzMHB4IDEwcHg7IiBhbGlnbj0iY2VudGVyIj4NCjx0YWJsZSBzdHlsZT0iYmFja2dy
b3VuZDogI2ZmZmZmZjsgYm9yZGVyLXJhZGl1czogMTBweDsgYm94LXNoYWRvdzogMCA0cHggMTBw
eCByZ2JhKDAsMCwwLDAuMSk7IiBib3JkZXI9IjAiIHdpZHRoPSI2MDAiIGNlbGxzcGFjaW5nPSIw
IiBjZWxscGFkZGluZz0iMCI+DQo8dGJvZHk+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDMw
cHggMjBweCAxMHB4OyIgYWxpZ249ImNlbnRlciI+DQo8aDEgaWQ9InRpdGxlIj48c3BhbiBzdHls
ZT0iY29sb3I6ICMwMDAwZmY7Ij48ZW0+Tm90YWlyZXMgZGUgRnJhbmNlPC9lbT48L3NwYW4+PC9o
MT4NCjxwIHN0eWxlPSJjb2xvcjogIzY2NjsgZm9udC1zaXplOiAxNHB4OyBtYXJnaW46IDVweCAw
OyI+PGVtPlNlcnZpY2UgZGUgdHJhbnNmZXJ0IGRlIGZpY2hpZXJzPC9lbT48L3A+DQo8L3RkPg0K
PC90cj4NCjx0cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMjBweCAzMHB4OyI+DQo8cCBzdHlsZT0i
Zm9udC1zaXplOiAxNnB4OyBjb2xvcjogIzMzMzsgbWFyZ2luOiAwIDAgMTBweDsiPjxlbT5Cb25q
b3VyIDxzdHJvbmc+TXIgJmFtcDsgTW1lPC9zdHJvbmc+LDwvZW0+PC9wPg0KPHAgc3R5bGU9ImZv
bnQtc2l6ZTogMTVweDsgY29sb3I6ICM1NTU7IGxpbmUtaGVpZ2h0OiAxLjU7IG1hcmdpbjogMTBw
eCAwOyI+Tm91cyB0ZW5vbnMgw6Agdm91cyBpbmZvcm1lciBxdWUgdm91cyBkZXZleiB0w6lsw6lj
aGFyZ2VyIHZvdHJlIGZpY2hpZXIgZGFucyBsZXMgMjQgcHJvY2hhaW5lcyBoZXVyZXMsIHN1aXRl
IGF1eHF1ZWxsZXMgbGUgZmljaGllciBzZXJhIHN1cHByaW3DqSBkZSBub3Mgc2VydmV1cnMuIE1l
cmNpLjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlci1sZWZ0OiA0cHggc29saWQgIzAwN0JGRjsgYmFj
a2dyb3VuZDogI2Y5ZjlmOTsgcGFkZGluZzogMTBweCAxNXB4OyBtYXJnaW46IDIwcHggMDsiPg0K
PGRpdiBjbGFzcz0icGFuZWwiPg0KPHA+PGVtPjxzdHJvbmc+RmljaGllciA6PC9zdHJvbmc+IDxz
cGFuIGlkPSJmaWxlLW5hbWUiPkRvY3VtZW50LWltcG9ydGFudC5wZGY8L3NwYW4+PC9lbT48L3A+
DQo8cD48ZW0+PHN0cm9uZz5FeHDDqWRpdGV1ciA6PC9zdHJvbmc+ICoqKioqKkAqKioqKi5jb208
L2VtPjwvcD4NCjxwPjxlbT48c3Ryb25nPlRhaWxsZSA6PC9zdHJvbmc+IDxzcGFuIGlkPSJzaXpl
Ij4yLjQgTW88L3NwYW4+PC9lbT48L3A+DQo8cD7CoDwvcD4NCjxwPjxlbT5DbGlxdWV6IHN1ciBs
ZSBib3V0b24gY2ktZGVzc291cyBwb3VyIHTDqWzDqWNoYXJnZXIgbGUgZmljaGllciAoZmFjdHVy
ZSwgZGV2aXMsIG91IGF1dHJlIGRvY3VtZW50IGltcG9ydGFudCkuPC9lbT48L3A+DQo8L2Rpdj4N
CjwvZGl2Pg0KPHAgc3R5bGU9InRleHQtYWxpZ246IGNlbnRlcjsgbWFyZ2luOiAzMHB4IDA7Ij48
ZW0+PGEgc3R5bGU9ImJhY2tncm91bmQ6ICMwMDdCRkY7IGNvbG9yOiAjZmZmOyB0ZXh0LWRlY29y
YXRpb246IG5vbmU7IHBhZGRpbmc6IDE1cHggMzBweDsgYm9yZGVyLXJhZGl1czogNXB4OyBmb250
LXNpemU6IDE2cHg7IGRpc3BsYXk6IGlubGluZS1ibG9jazsiIGhyZWY9Imh0dHBzOi8vc2l0ZXMu
Z29vZ2xlLmNvbS92aWV3L3R5ci0yNC9hY2N1ZWlsIj4gVMOJTMOJQ0hBUkdFUiBWT1RSRSBGSUNI
SUVSIDwvYT48L2VtPjwvcD4NCjxwIHN0eWxlPSJmb250LXNpemU6IDEzcHg7IGNvbG9yOiAjOTk5
OyBtYXJnaW46IDA7Ij48ZW0+TmUgcGFydGFnZXogcGFzIGNlIGxpZW4gYXZlYyBkZXMgdGllcnMu
PC9lbT48L3A+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMjBweCAz
MHB4OyBmb250LXNpemU6IDEycHg7IGNvbG9yOiAjYWFhOyIgYWxpZ249ImNlbnRlciI+PGVtPkNl
IG1lc3NhZ2UgZXN0IGfDqW7DqXLDqSBhdXRvbWF0aXF1ZW1lbnQuIE1lcmNpIGRlIG5lIHBhcyB5
IHLDqXBvbmRyZS48L2VtPjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4NCjwvdGFibGU+DQo8L3RkPg0K
PC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg==



--12260d0f56c39cc9fb232999bc9c9ec84--


